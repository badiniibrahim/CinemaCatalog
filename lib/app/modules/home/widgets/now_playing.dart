import 'package:db_movie/app/modules/home/widgets/vote_average.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/movie.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'cached_network_image_widget.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 300,
        child: ListView.separated(
          separatorBuilder: (context, index) => const VerticalDivider(
            color: Colors.transparent,
            width: 15,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.state.nowPlayingMovieList.length,
          itemBuilder: (context, index) {
            Movie movie = controller.state.nowPlayingMovieList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.showMovieDetail(movie.id ?? 0));
                  },
                  child: ClipRRect(
                    child: CachedNetworkImageWidget(movie: movie),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 180,
                  child: Text(
                    movie.title?.toUpperCase() ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli',
                    ),
                  ),
                ),
                VoteAverage(movie: movie),
              ],
            );
          },
        ),
      ),
    );
  }
}
