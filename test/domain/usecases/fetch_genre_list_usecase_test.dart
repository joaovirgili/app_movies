import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/domain/repositories/repositories.dart';
import 'package:movies/domain/usecases/usecases.dart';

class GenreRepositoryMock extends Mock implements IGenreRepository {}

void main() {
  FetchGenreListUsecase sut;
  GenreRepositoryMock genreRepositoryMock;

  setUp(() {
    genreRepositoryMock = GenreRepositoryMock();
    sut = FetchGenreListUsecase(genreRepository: genreRepositoryMock);
  });

  test('Should call repository fetchGenreList', () {
    sut();
    verify(genreRepositoryMock.fetchGenreList()).called(1);
  });
}
