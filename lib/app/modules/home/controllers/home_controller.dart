import 'package:db_movie/app/data/repositories/home_repository.dart';
import 'package:db_movie/app/modules/home/state.dart';
import 'package:get/get.dart';

import '../../../core/abstractions/i_controller.dart';

class HomeController extends GetxController with IController {
  final HomeState state = HomeState();
  final HomeRepository _repository = HomeRepository();

  Future<void> getNowPlayingMovie(int movieId) async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        if (movieId == 0) {
          final response = await _repository.getNowPlayingMovie();
          state.nowPlayingMovieList = response;
        } else {
          //print(movieId);
          final response = await _repository.getMovieByGenre(movieId);
          state.nowPlayingMovieList = response;
        }
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }

  Future<void> getGenreList() async {
    actionPerform(
      action: () async {
        //state.isLoading = true;
        final response = await _repository.getGenreList();
        state.genreList = response;
      },
      callback: () {
        // state.isLoading = false;
      },
    );
  }

  void setSelectedGenre(int id) {
    state.selectedGenre = id;
  }

  @override
  void onInit() {
    getNowPlayingMovie(28);
    getGenreList();
    super.onInit();
  }
}
