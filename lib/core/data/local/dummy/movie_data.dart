class Movie {
  final String name;
  final int year;
  final String duration;
  final String imgURL;

  Movie({
    required this.name,
    required this.year,
    required this.duration,
    required this.imgURL,
  });
}
List<Movie> movies = [
 Movie(
    name: "Through my Window",
    year: 2022,
    duration: "1h 38m",
    imgURL:
        'assets/images/caraousel_image_1.png',
  ),
  // Add more categories as needed
   Movie(
    name: "Elemental",
    year: 2023,
    duration: "1h 49m",
    imgURL: 'assets/images/caraousel_image_2.png',
  ),
    Movie(
    name: "Oppenheimer",
    year: 2023,
    duration: "3h 00m",
    imgURL: 'assets/images/caraousel_image_3.png',
  ),
];
