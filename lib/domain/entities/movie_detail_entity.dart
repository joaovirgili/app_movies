class MovieDetailsEntity {
  MovieDetailsEntity({
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

  MovieDetailsEntity copyWith({
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
      MovieDetailsEntity(
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
}
