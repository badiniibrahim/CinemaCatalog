import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/genre.dart';
import '../controllers/home_controller.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 45,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const VerticalDivider(
              color: Colors.transparent,
              width: 5,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: controller.state.genreList.length,
            itemBuilder: (context, index) {
              Genre genre = controller.state.genreList[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Genre genre = controller.state.genreList[index];
                      controller.setSelectedGenre(genre.id ?? 28);
                      controller.getNowPlayingMovie(genre.id ?? 28);
                    },
                    child: Obx(
                      () => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: (genre.id ==
                                  controller.state.selectedGenre) //28 Action
                              ? Colors.yellow[800]
                              : Colors.white,
                        ),
                        child: Text(
                          genre.name?.toUpperCase() ?? "",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: (genre.id == controller.state.selectedGenre)
                                ? Colors.white
                                : Colors.black45,
                            fontFamily: 'muli',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
