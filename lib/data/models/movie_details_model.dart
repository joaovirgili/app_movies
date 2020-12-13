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

  MovieDetailsModel copyWith({
    int budget,
    List<String> genres,
    int id,
    String originalLanguage,
    String originalTitle,
    String overview,
    String posterPath,
    List<String> productionCompanies,
    DateTime releaseDate,
    String title,
  }) =>
      MovieDetailsModel(
        budget: budget ?? this.budget,
        genres: genres ?? this.genres,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
      );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        budget: json['budget'] == null ? null : json['budget'],
        genres: json['genres'] == null
            ? null
            : (json['genres'] as List).map((e) => e['name'] as String).toList(),
        id: json['id'] == null ? null : json['id'],
        originalLanguage: json['original_language'] == null
            ? null
            : json['original_language'],
        originalTitle:
            json['original_title'] == null ? null : json['original_title'],
        overview: json['overview'] == null ? null : json['overview'],
        posterPath: json['poster_path'] == null ? null : json['poster_path'],
        productionCompanies: json['production_companies'] == null
            ? null
            : (json['production_companies'] as List)
                .map((e) => e['name'] as String)
                .toList(),
        releaseDate: json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        title: json['title'] == null ? null : json['title'],
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
      );
}
