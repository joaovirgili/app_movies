class MovieCardUiModel {
  MovieCardUiModel({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.posterPath,
    this.title,
  });

  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String posterPath;
  final String title;
}
