import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/app/app_module.dart';

import 'package:movies/app/modules/home/home.dart';
import 'package:movies/data/http/http_client.dart';
import 'package:movies/domain/entities/entities.dart';
import 'package:movies/domain/repositories/repositories.dart';
import 'package:movies/domain/usecases/usecases.dart';

class FetchGenreListUsecaseMock extends Mock implements IFetchGenreListUsecase {
}

class GenreRepositoryMock extends Mock implements IGenreRepository {}

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  final fetchGenreListMock = FetchGenreListUsecaseMock();
  initModules(
    [HomeModule(), AppModule()],
    changeBinds: [
      BindInject<IFetchGenreListUsecase>((i) => fetchGenreListMock),
      BindInject<IGenreRepository>((i) => GenreRepositoryMock()),
      BindInject<IHttpClient>((i) => HttpClientMock()),
    ],
  );
  HomeController sut;

  setUp(() async {
    when(fetchGenreListMock()).thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 200));
      return [GenreEntity(name: '', id: 0)];
    });

    sut = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    test('First Test', () {
      expect(sut, isInstanceOf<HomeController>());
    });

    test('Should call fetchGenresUsecase on init', () {
      expect(sut.isLoadingGenre, isTrue);
      verify(fetchGenreListMock()).called(1);
    });

    test('Should stop loading after fetchGenresUsecase finishes', () async {
      await sut.fetchGenreList();
      expect(sut.isLoadingGenre, isFalse);
    });

    test('Should stop loading after fetchGenresUsecase finishes', () async {
      await sut.fetchGenreList();
      expect(sut.genreList, isNotEmpty);
    });
  });
}
