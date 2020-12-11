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
    sut = FetchMovieListByGenre(genreRepository: genreRepositoryMock);
  });

  test('Should call repository fetchMovieList', () {
    final genresId = [1, 2, 3];
    sut.call(genresId: genresId);
    verify(genreRepositoryMock.fetchMovieList(FetchMovieListParams(
      genresId: genresId,
    ))).called(1);
  });
}
