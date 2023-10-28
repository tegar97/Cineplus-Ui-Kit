import 'package:flutter/material.dart';

class MoviePosterItem extends StatelessWidget {
  const MoviePosterItem(
      {super.key, required this.imagePath, this.type = "general_poster"});

  final String imagePath;
  final String type;
  @override
  Widget build(BuildContext context) {
        var maxWidth = MediaQuery.of(context).size.width;

    return Container(
      width: type == 'general_poster' ? 100 : maxWidth * 0.5,
      margin: EdgeInsets.only(right: 12),
      height:   type == 'general_poster'  ? 140 : 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
