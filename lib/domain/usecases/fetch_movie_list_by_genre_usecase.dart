import 'package:meta/meta.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

abstract class IFetchMovieListByGenre {
  Future<MovieListPageEntity> call({
    @required int genreId,
    int page = 1,
  });
}

class FetchMovieListByGenre extends IFetchMovieListByGenre {
  final IMovieRepository movieRepository;

  FetchMovieListByGenre({@required this.movieRepository});

  Future<MovieListPageEntity> call({
    @required int genreId,
    int page = 1,
  }) {
    return movieRepository.fetchMovieList(FetchMovieListParams(
      genreId: genreId,
      page: page,
    ));
  }
}
