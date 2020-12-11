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
    this.genreIds,
    this.id,
    this.posterPath,
    this.title,
  });

  final List<int> genreIds;
  final int id;
  final String posterPath;
  final String title;

  MoviePreviewEntity copyWith({
    List<int> genreIds,
    int id,
    String posterPath,
    String title,
  }) =>
      MoviePreviewEntity(
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        posterPath: posterPath ?? this.posterPath,
        title: title ?? this.title,
      );
}
