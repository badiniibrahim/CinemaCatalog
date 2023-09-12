import 'package:db_movie/app/modules/movieDetail/bindings/movie_detail_bindings.dart';
import 'package:db_movie/app/modules/movieDetail/views/movie_detail_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL,
      page: () => const MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
  ];
}
