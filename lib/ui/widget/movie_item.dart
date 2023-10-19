import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/theme.dart';

class MovieItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String rating;
  final String year;
  final String duration;

  const MovieItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.year,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;

    return Container(
      width: maxWidth * 0.7,
      height: 117,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xff222222),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              width: maxWidth * 0.25,
              fit: BoxFit.cover,
              height: 117,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                          style:
                                                headingTextStyle.copyWith(fontSize: 14),
                                          ),
                      
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFC700),
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            rating,
                           style: subtitleTextStyle.copyWith(
                                color: Colors.white), 
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            year,
                          style: subtitleTextStyle.copyWith(
                                color: Color(0xff898989)),
                          ),
                          SizedBox(width: 5),
                          Text(
                            duration,
                             style: subtitleTextStyle.copyWith(
                                                    color: Color(0xff898989)),
                                              
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ic_play_icon.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8),
                       Text(
                      "Watch Now",
                      style: headingTextStyle.copyWith(fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
