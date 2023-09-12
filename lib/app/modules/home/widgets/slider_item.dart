import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:db_movie/app/core/theme/texts.style.dart';
import 'package:db_movie/app/data/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class SliderItem extends StatelessWidget {
  final HomeController controller;

  const SliderItem({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: controller.state.nowPlayingMovieList.length,
          itemBuilder: (context, index, realIdx) {
            Movie movie = controller.state.nowPlayingMovieList[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.showMovieDetail(movie.id ?? 0));
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    // ignore: sort_child_properties_last
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/img_not_found.jpg'),
                          ),
                        ),
                      ),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      left: 15,
                    ),
                    child: Text(
                      movie.title ?? "",
                      style: IText.labelStyle.copyWith(
                        fontFamily: 'muli',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}
