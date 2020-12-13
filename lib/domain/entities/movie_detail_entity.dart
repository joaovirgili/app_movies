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
}
