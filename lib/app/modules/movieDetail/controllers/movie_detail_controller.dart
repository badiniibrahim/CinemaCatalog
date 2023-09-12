import 'package:db_movie/app/core/abstractions/i_controller.dart';
import 'package:db_movie/app/data/repositories/movie_detail_repository.dart';
import 'package:db_movie/app/modules/movieDetail/state.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController with IController {
  final MovieDetailState state = MovieDetailState();
  final MovieDetailRepository _repository = MovieDetailRepository();

  Future<void> getMovieDetail(int movieId) async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.getMovieDetail(movieId);
        state.movieDetail = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }
}
