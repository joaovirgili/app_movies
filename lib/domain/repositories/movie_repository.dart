import '../entities/entities.dart';

import 'package:meta/meta.dart';

abstract class IMovieRepository {
  Future<MovieEntity> fetchMovie(FetchMovieParams params);

  Future<MovieListPageEntity> fetchMovieList(FetchMovieListParams param);
}

class FetchMovieParams {
  final int id;
  final String language;

  FetchMovieParams({@required this.id, this.language});
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
