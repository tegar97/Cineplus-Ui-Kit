class Poster {
  String imagePath;
  String category;

  Poster({required this.imagePath , required this.category});
}

List<Poster> posters = [
  Poster(imagePath: 'assets/images/movie_cover_1.png', category: "excited"),
  Poster(imagePath: 'assets/images/movie_poster_2.jpg', category: "excited"),
  Poster(imagePath: 'assets/images/movie_poster_3.jpg', category: "excited"),
  Poster(imagePath: 'assets/images/movie_poster_4.jpeg', category: "excited"),
  Poster(imagePath: 'assets/images/movie_poster_9.jpeg', category: "Sad"),

];

List<Poster> popularMovie = [
  Poster(imagePath: 'assets/images/movie_poster_5.jpg', category: "excited"),
  Poster(imagePath: 'assets/images/movie_poster_6.jpg', category: "excited"),
  Poster(imagePath: 'assets/images/movie_poster_7.jpg', category: "excited"),
  Poster(imagePath: 'assets/images/movie_poster_8.jpg', category: "excited"),
];

