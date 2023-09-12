import 'dart:convert';

import 'package:db_movie/app/data/models/genre.dart';
import 'package:db_movie/app/data/models/movie.dart';
import 'package:dio/dio.dart';

import '../../core/abstractions/i_repository.dart';
import '../models/movie_models.dart';
import '../providers/home_provider.dart';

class HomeRepository extends IRepository<Response> {
  @override
  HomeProvider get provider => HomeProvider();

  Future<MoviesModel> getPopularMovie() async {
    final response = await provider.getAll();
    JsonEncoder encoder = const JsonEncoder.withIndent('');
    return MoviesModel.fromJson(encoder.convert(response.data));
  }

  Future<List<Movie>> getNowPlayingMovie() async {
    final response = await provider.getNowPlayingMovie();
    var movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }

  Future<List<Genre>> getGenreList() async {
    final response = await provider.getGenreList();
    var genres = response.data['genres'] as List;
    List<Genre> genreList = genres.map((g) => Genre.fromJson(g)).toList();
    return genreList;
  }

  Future<List<Movie>> getMovieByGenre(int movieId) async {
    final response = await provider.getMovieByGenre(movieId);
    var movies = response.data['results'] as List;
    List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
    return movieList;
  }
}
