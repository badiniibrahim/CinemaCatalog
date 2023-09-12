import 'package:db_movie/app/data/models/movie_detail.dart';
import 'package:get/get.dart';

class MovieDetailState {
  // isLoading
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final Rx<MovieDetail> _movieDetail = MovieDetail().obs;
  set movieDetail(value) => _movieDetail.value = value;
  MovieDetail get movieDetail => _movieDetail.value;
  Rx<MovieDetail> get rxMovieDetail => _movieDetail;
}
