class MovieModel {
  final int id;
  final String title;
  final String message;
  final String posterPath;
  final String backdropPath;
  final String originalTitle;
  final List genreIds;
  final double voteAverage;
  final String overview;
  final String releaseDate;

  MovieModel({
    this.id,
    this.title,
    this.message,
    this.posterPath,
    this.backdropPath,
    this.originalTitle,
    this.genreIds,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  List<Object> get props => [
    id,
    title,
    message,
    posterPath,
    backdropPath,
    originalTitle,
    genreIds,
    voteAverage,
    overview,
    releaseDate,
  ];

  // factory MovieModel.fromJson(Map<String, dynamic> json) {
  //   return MovieModel(
  //     title: json['title'],
  //     message: json['message'],
  //     posterPath: json['poster_path'],
  //     backdropPath: json['backdrop_path'],
  //     originalTitle: json['original_title'],
  //     genreIds: json['genre_ids'],
  //     voteAverage: json['vote_average'],
  //     overview: json['overview'],
  //     releaseDate: json['release_date'],
  //   );
  // }
}
