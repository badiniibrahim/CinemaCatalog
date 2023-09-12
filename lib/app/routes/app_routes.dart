part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static Future<String> get INITIAL async {
    return Routes.HOME;
  }

  static const HOME = _Paths.HOME;
  static showMovieDetail(int movieId) => "/movie_detail/$movieId";
}

abstract class _Paths {
  _Paths._();
  static const HOME = "/home";
  static const MOVIE_DETAIL = "/movie_detail/:movieId";
}
