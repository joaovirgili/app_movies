import 'package:meta/meta.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

abstract class IFetchMovieListByGenre {
  Future<MovieListPageEntity> call({
    @required List<int> genresId,
    int page = 1,
  });
}

class FetchMovieListByGenre extends IFetchMovieListByGenre {
  final IMovieRepository genreRepository;

  FetchMovieListByGenre({@required this.genreRepository});

  Future<MovieListPageEntity> call({
    @required List<int> genresId,
    int page = 1,
  }) {
    return genreRepository.fetchMovieList(FetchMovieListParams(
      genresId: genresId,
      page: page,
    ));
  }
}
