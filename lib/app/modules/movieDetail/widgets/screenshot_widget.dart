import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/screen_shot.dart';
import '../controllers/movie_detail_controller.dart';

class ScreenshotWidget extends StatelessWidget {
  const ScreenshotWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MovieDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.state.movieDetail.movieImage!.posters!.length,
        itemBuilder: (context, index) {
          Screenshot image =
              controller.state.movieDetail.movieImage!.posters![index];
          return Card(
            elevation: 3,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
                ),
                imageUrl: 'https://image.tmdb.org/t/p/w500${image.imagePath}',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
