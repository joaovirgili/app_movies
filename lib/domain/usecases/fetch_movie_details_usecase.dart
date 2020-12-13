import 'package:meta/meta.dart';

import '../repositories/movie_repository.dart';
import '../entities/entities.dart';

abstract class IFetchMovieDetails {
  Future<MovieDetailsEntity> call(int movieId);
}

class FetchMovieDetails implements IFetchMovieDetails {
  final IMovieRepository movieRepository;

  FetchMovieDetails({@required this.movieRepository});

  @override
  Future<MovieDetailsEntity> call(int movieId) {
    return movieRepository.fetchMovie(FetchMovieDetailsParams(id: movieId));
  }
}
