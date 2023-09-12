import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/abstractions/i_provider.dart';
import '../../core/provider/api_provider.dart';

class HomeProvider extends IProvider<Response> {
  @override
  String get endpoint =>
      "/movie/popular?api_key=${dotenv.env['API_KEY']}&language=fr";

  Future<Response> getAll() async {
    return await ApiProvider.instance.get(
      endpoint: endpoint,
    );
  }

  Future<Response> getNowPlayingMovie() async {
    return await ApiProvider.instance.get(
      endpoint:
          "/movie/now_playing?api_key=${dotenv.env['API_KEY']}&language=fr",
    );
  }

  Future<Response> getGenreList() async {
    return await ApiProvider.instance.get(
      endpoint:
          "/genre/movie/list?api_key=${dotenv.env['API_KEY']}&language=fr",
    );
  }

  Future<Response> getMovieByGenre(int movieId) async {
    return await ApiProvider.instance.get(
      endpoint:
          "/discover/movie?with_genres=$movieId&api_key=${dotenv.env['API_KEY']}&language=fr",
    );
  }
}
