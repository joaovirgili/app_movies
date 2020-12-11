import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/domain/repositories/repositories.dart';
import 'package:movies/domain/usecases/usecases.dart';

class MovieRepositoryMock extends Mock implements IMovieRepository {}

void main() {
  IFetchMovieListByGenre sut;
  MovieRepositoryMock genreRepositoryMock;

  setUp(() {
    genreRepositoryMock = MovieRepositoryMock();
    sut = FetchMovieListByGenre(movieRepository: genreRepositoryMock);
  });

  test('Should call repository fetchMovieList', () {
    final genreId = 1;
    sut.call(genreId: genreId);
    verify(genreRepositoryMock.fetchMovieList(FetchMovieListParams(
      genreId: genreId,
    ))).called(1);
  });
}
