import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cineplus/core/data/local/dummy/movie_data.dart';
import 'package:cineplus/core/data/local/dummy/poster_data.dart';
import 'package:cineplus/ui/config/theme.dart';
import 'package:cineplus/ui/widget/category_item.dart';
import 'package:cineplus/ui/widget/movie_poster_item.dart';
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color(0x44000000),
          elevation: 0,
          leading: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                'assets/images/cineplus_logo.png',
                width: 40,
                height: 40,
              ),
            ],
          ),
          actions: [Image.asset('assets/images/button_standar.png')],
        ),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MovieBanner(),
                  const _MyListSection(),
                  Text(
                    "Movie Based on your mood",
                    style: headingTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
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
                  ),
                  const SizedBox(height: 12),
              Container(
                    width: double.infinity,
                    height: 140,
                    child: ListView.builder(
                      itemCount: posters.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (posters[index].category.toLowerCase() ==
                            activeCategory.toString().toLowerCase()) {
                          return MoviePosterItem(
                            imagePath: posters[index].imagePath,
                          );
                        } else {
                          // Jika kategori poster tidak sama dengan kategori yang aktif, return widget kosong
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  const _PopularList(),
                  const SizedBox(height: 20),
                  const NewReleaseList()
                ],
              ),
            ),
          ),
        ));
  }
}

/*
   Movie Banner Caraousel 
  */
class _MovieBanner extends StatefulWidget {
  @override
  State<_MovieBanner> createState() => _MovieBannerState();
}

class _MovieBannerState extends State<_MovieBanner> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      items: movies
          .map(
            (movie) => Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(movie.imgURL),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.name, style: headingTextStyle),
                        const SizedBox(height: 11),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Movie", style: regularText),
                            _buildDivider(),
                            Text(movie.year.toString(), style: regularText),
                            _buildDivider(),
                            Text(movie.duration, style: regularText),
                          ],
                        ),
                        Row(
                          children: movies.asMap().entries.map((entry) {
                            return Container(
                              width: _current == entry.key ? 30.0 : 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 4.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: _current == entry.key
                                    ? BorderRadius.circular(3)
                                    : BorderRadius.circular(100),
                                color: Colors.white.withOpacity(
                                  _current == entry.key ? 0.9 : 0.4,
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/button_play.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),
      width: 2,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

/*

  Latest Moview watch section 
*/
class _MyListSection extends StatelessWidget {
  const _MyListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const ListInformation(title: "My list"),
          const SizedBox(height: 12),
          // You can change this list view to listview.builder if you want
          Container(
              width: double.infinity,
              height: 117,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const MovieItem(
                    imagePath: 'assets/images/movie_cover_1.png',
                    title: 'Squid Game',
                    rating: '8.0/10 IMDb',
                    year: '2022',
                    duration: '2h 39m',
                  ),
                  const MovieItem(
                    imagePath: 'assets/images/movie_poster_8.jpg',
                    title: 'Elemental',
                    rating: '7.0/10 IMDb',
                    year: '2023',
                    duration: '1h 49m',
                  ),
                  const MovieItem(
                    imagePath: 'assets/images/movie_poster_9.jpeg',
                    title: 'UP ',
                    rating: '8.3/10 IMDb',
                    year: '2009',
                    duration: '1h 23m',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class _PopularList extends StatelessWidget {
  const _PopularList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const ListInformation(title: "Popular List"),
          const SizedBox(height: 12),
          Container(
              width: double.infinity,
              height: 140,
              child: ListView.builder(
                  itemCount: popularMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MoviePosterItem(
                      imagePath: popularMovie[index].imagePath,
                    );
                  })),
        ],
      ),
    );
  }
}

class NewReleaseList extends StatelessWidget {
  const NewReleaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const ListInformation(title: "New Release"),
          const SizedBox(height: 12),
          Container(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                  itemCount: posters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MoviePosterItem(
                      imagePath: posters[index].imagePath,
                      type: 'wide_poster',
                    );
                  })),
        ],
      ),
    );
  }
}

class ListInformation extends StatelessWidget {
  const ListInformation({
    super.key,
    required this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title ?? "My list",
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
            const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
