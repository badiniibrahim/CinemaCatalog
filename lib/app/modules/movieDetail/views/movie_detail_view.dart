import 'dart:io';
import 'package:db_movie/app/modules/movieDetail/controllers/movie_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/movie_detail_item.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getMovieDetail(int.parse(Get.parameters["movieId"] ?? ""));

    return WillPopScope(
      child: Scaffold(
        body: Obx(() => _buildDetailBody(context)),
      ),
      onWillPop: () async => true,
    );
  }

  Widget _buildDetailBody(BuildContext context) {
    return controller.state.isLoading
        ? Center(
            child: Platform.isAndroid
                ? const CircularProgressIndicator()
                : const CupertinoActivityIndicator(),
          )
        : MovieDetailItem(controller: controller);
  }
}
