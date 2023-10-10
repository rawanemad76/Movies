import 'package:movies_tv_app/movies_module/domain/entities/movie.dart';

class MoviesModel extends Movie {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> map) => MoviesModel(
        id: map["id"],
        title: map["title"],
        backdropPath: map["backdrop_path"],
        genreIds: List<int>.from(map["genre_ids"]),
        overview: map["overview"],
        voteAverage: map["vote_average"].toDouble(),
        releaseDate: map["release_date"],
      );
}
