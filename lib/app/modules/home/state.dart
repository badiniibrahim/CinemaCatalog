import 'package:db_movie/app/data/models/genre.dart';
import 'package:get/get.dart';

import '../../data/models/movie.dart';
import '../../data/models/movie_models.dart';

class HomeState {
  // isLoading
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<Result> _movieList = <Result>[].obs;
  set movieList(value) => _movieList.value = value;
  List<Result> get movieList => _movieList;

  final RxList<Movie> _nowPlayingMovieList = <Movie>[].obs;
  set nowPlayingMovieList(value) => _nowPlayingMovieList.value = value;
  List<Movie> get nowPlayingMovieList => _nowPlayingMovieList;

  final RxList<Genre> _genreList = <Genre>[].obs;
  set genreList(value) => _genreList.value = value;
  List<Genre> get genreList => _genreList;

  final RxInt _selectedGenre = RxInt(28);
  set selectedGenre(value) => _selectedGenre.value = value;
  int get selectedGenre => _selectedGenre.value;
}
