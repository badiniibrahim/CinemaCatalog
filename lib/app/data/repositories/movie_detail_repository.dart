import 'package:db_movie/app/data/providers/movie_detail_provider.dart';
import 'package:dio/dio.dart';

import '../../core/abstractions/i_repository.dart';
import '../models/movie_detail.dart';
import '../models/movie_image.dart';

class MovieDetailRepository extends IRepository<Response> {
  @override
  MovieDetailProvider get provider => MovieDetailProvider();

  Future<MovieDetail> getMovieDetail(int movieId) async {
    final response = await provider.getMovieDetail(movieId);
    MovieDetail movieDetail = MovieDetail.fromJson(response.data);
    movieDetail.trailerId = await getYoutubeId(movieId);
    movieDetail.movieImage = await getMovieImage(movieId);
    return movieDetail;
  }

  Future<String> getYoutubeId(int movieId) async {
    final response = await provider.getYoutubeId(movieId);
    var youtubeId = response.data['results'].length == 0
        ? ""
        : response.data['results'][0]['key'];

    return youtubeId;
  }

  Future<MovieImage> getMovieImage(int movieId) async {
    final response = await provider.getMovieImage(movieId);
    return MovieImage.fromJson(response.data);
  }
}
