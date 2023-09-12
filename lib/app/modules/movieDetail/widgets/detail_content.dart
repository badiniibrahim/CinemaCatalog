import 'package:flutter/material.dart';

import '../../../core/theme/texts.style.dart';
import '../controllers/movie_detail_controller.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MovieDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date de sortie'.toUpperCase(),
              style: IText.text1Bold.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'muli',
              ),
            ),
            Text(
              controller.state.movieDetail.releaseDate ?? "",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.yellow[800],
                    fontSize: 12,
                    fontFamily: 'muli',
                  ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Durée'.toUpperCase(),
              style: IText.text1Bold.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'muli',
              ),
            ),
            Text(
              controller.state.movieDetail.runtime ?? "",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.yellow[800],
                    fontSize: 12,
                    fontFamily: 'muli',
                  ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'budget'.toUpperCase(),
              style: IText.text1Bold.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'muli',
              ),
            ),
            Text(
              controller.state.movieDetail.budget ?? "",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.yellow[800],
                    fontSize: 12,
                    fontFamily: 'muli',
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
