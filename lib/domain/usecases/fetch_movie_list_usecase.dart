import '../entities/entities.dart';

abstract class IFetchMovieList {
  Future<MovieListPageEntity> fetch(FetchMovieListParams params);
}

class FetchMovieListParams {
  final String language;
  final List<int> genresId;
  final int page;
  final bool includeAdult;

  FetchMovieListParams({
    this.language,
    this.genresId,
    this.page = 1,
    this.includeAdult = false,
  });
}
