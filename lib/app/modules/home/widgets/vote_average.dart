import 'package:db_movie/app/core/theme/texts.style.dart';
import 'package:flutter/material.dart';

import '../../../data/models/movie.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 14,
        ),
        const SizedBox(width: 5),
        Text(
          movie.voteAverage ?? "",
          style: IText.labelStyle.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
