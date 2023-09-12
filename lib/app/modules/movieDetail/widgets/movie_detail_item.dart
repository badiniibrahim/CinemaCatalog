import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_movie/app/modules/movieDetail/widgets/screenshot_widget.dart';
import 'package:db_movie/app/modules/movieDetail/widgets/youtube_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/texts.style.dart';
import '../controllers/movie_detail_controller.dart';
import 'detail_content.dart';

class MovieDetailItem extends StatelessWidget {
  const MovieDetailItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MovieDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'https://image.tmdb.org/t/p/original/${controller.state.movieDetail.backdropPath}',
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Platform.isAndroid
                  ? const CircularProgressIndicator()
                  : const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_not_found.jpg'),
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            YoutubeView(controller: controller),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aperçu'.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: IText.text1Bold.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'muli',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 35,
                    child: Text(
                      controller.state.movieDetail.overview ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontFamily: 'muli'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DetailContent(controller: controller),
                  const SizedBox(height: 10),
                  Text(
                    "Captures d'écran".toUpperCase(),
                    style: IText.text1Bold.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli',
                    ),
                  ),
                  ScreenshotWidget(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
