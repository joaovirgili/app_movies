class MovieListPageEntity {
  MovieListPageEntity({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  final int page;
  final List<MoviePreviewEntity> movies;
  final int totalPages;
  final int totalResults;
}

class MoviePreviewEntity {
  MoviePreviewEntity({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.title,
  });

  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String title;
}
