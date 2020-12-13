import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/domain/repositories/repositories.dart';
import 'package:movies/domain/usecases/usecases.dart';

class MovieRepositoryMock extends Mock implements IMovieRepository {}

void main() {
  IFetchMovieDetails sut;
  MovieRepositoryMock genreRepositoryMock;

  setUp(() {
    genreRepositoryMock = MovieRepositoryMock();
    sut = FetchMovieDetails(movieRepository: genreRepositoryMock);
  });

  test('Should call repository fetchMovieDetails with correct params', () {
    final movieId = 1;
    sut.call(movieId);
    verify(genreRepositoryMock.fetchMovie(FetchMovieDetailsParams(id: movieId)))
        .called(1);
  });
}
