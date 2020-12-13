import '../../domain/entities/entities.dart';

class MovieDetailsModel {
  MovieDetailsModel({
    this.budget,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.runtime,
  });

  final int budget;
  final List<String> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final List<String> productionCompanies;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int runtime;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        budget: json['budget'],
        genres: json['genres'] == null
            ? null
            : (json['genres'] as List).map((e) => e['name'] as String).toList(),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        productionCompanies: json['production_companies'] == null
            ? null
            : (json['production_companies'] as List)
                .map((e) => e['name'] as String)
                .toList(),
        releaseDate: json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        title: json['title'],
        voteAverage: json['vote_average'],
        runtime: json['runtime'],
      );

  MovieDetailsEntity toEntity() => MovieDetailsEntity(
        budget: budget,
        genres: genres,
        id: id,
        originalLanguage: originalLanguage,
        overview: overview,
        posterPath: posterPath,
        productionCompanies: productionCompanies,
        releaseDate: releaseDate,
        title: title,
        originalTitle: originalTitle,
        voteAverage: voteAverage,
        runtime: runtime,
      );
}
