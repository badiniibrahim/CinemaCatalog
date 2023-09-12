import 'package:equatable/equatable.dart';

class Screenshot extends Equatable {
  final String? aspect;
  final String? imagePath;
  final int? height;
  final int? width;
  final String? countryCode;
  final double? voteAverage;
  final int? voteCount;

  const Screenshot({
    this.aspect,
    this.imagePath,
    this.height,
    this.width,
    this.countryCode,
    this.voteAverage,
    this.voteCount,
  });

  factory Screenshot.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json == null) {
      return const Screenshot();
    }

    return Screenshot(
        aspect: json['aspect_ratio']
            .toString(), //double.tryParse(json['aspect_ratio'])?.toString() ?? 1.0,
        imagePath: json['file_path'],
        height: json['height'],
        width: json['width'],
        countryCode: json['iso_639_1'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  @override
  List<Object> get props => [
        aspect ?? "",
        imagePath ?? "",
        height ?? 0,
        width ?? 0,
        countryCode ?? "",
        voteAverage ?? 0.0,
        voteCount ?? 0
      ];
}
