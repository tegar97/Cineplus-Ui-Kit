import 'package:cineplus/ui/config/theme.dart';
import 'package:cineplus/ui/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/data/local/dummy/category_data.dart';
import '../../widget/movie_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String activeCategory;

  void initState() {
    super.initState();
    activeCategory = "Excited";
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyListSection(),
                  Text(
                    "Movie Based on your mood",
                    style: headingTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: double.infinity,
                    height: 43,
                    child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            title: categories[index].title,
                            onPressed: () {
                              setState(() {
                                activeCategory = categories[index].title;
                              });
                            },
                            isActive: activeCategory == categories[index].title,
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class MyListSection extends StatelessWidget {
  const MyListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "My List",
                  style: headingTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    child: Text(
                      "See more",
                      style: subtitleTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
              width: double.infinity,
              height: 117,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MovieItem(
                    imagePath: 'assets/images/movie_cover_1.png',
                    title: 'Squid Game',
                    rating: '8.0/10 IMDb',
                    year: '2022',
                    duration: '2h 39m',
                  ),
                  MovieItem(
                    imagePath: 'assets/images/movie_cover_1.png',
                    title: 'Squid Game',
                    rating: '8.0/10 IMDb',
                    year: '2022',
                    duration: '2h 39m',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
