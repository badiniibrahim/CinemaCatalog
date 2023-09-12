import 'package:db_movie/app/data/models/screen_shot.dart';
import 'package:equatable/equatable.dart';

class MovieImage extends Equatable {
  final List<Screenshot>? backdrops;
  final List<Screenshot>? posters;

  const MovieImage({this.backdrops, this.posters});

  factory MovieImage.fromJson(Map<String, dynamic> result) {
    // ignore: unnecessary_null_comparison
    if (result == null) {
      return const MovieImage();
    }

    return MovieImage(
      backdrops: (result['backdrops'] as List)
          .map((b) => Screenshot.fromJson(b))
          .toList(),
      posters: (result['posters'] as List)
          .map((b) => Screenshot.fromJson(b))
          .toList(),
    );
  }

  @override
  List<Object> get props => [backdrops ?? [], posters ?? []];
}
