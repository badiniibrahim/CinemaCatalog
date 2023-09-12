import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/texts.style.dart';
import '../controllers/movie_detail_controller.dart';

class YoutubeView extends StatelessWidget {
  const YoutubeView({super.key, required this.controller});

  final MovieDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 120),
      child: GestureDetector(
        onTap: () async {
          final youtubeUrl =
              'https://www.youtube.com/embed/${controller.state.movieDetail.trailerId}';
          if (await canLaunch(youtubeUrl)) {
            await launch(youtubeUrl);
          }
        },
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.play_circle_outline,
                color: Colors.yellow,
                size: 65,
              ),
              Text(
                controller.state.movieDetail.title?.toUpperCase() ?? "",
                style: IText.labelStyle.copyWith(
                  fontFamily: 'muli',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
