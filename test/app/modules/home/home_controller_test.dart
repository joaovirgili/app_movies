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

class FetchMovieListByGenreMock extends Mock implements IFetchMovieListByGenre {
}

class GenreRepositoryMock extends Mock implements IGenreRepository {}

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  final fetchGenreListMock = FetchGenreListUsecaseMock();
  final fetchMovieListMock = FetchMovieListByGenreMock();
  initModules(
    [HomeModule(), AppModule()],
    changeBinds: [
      BindInject<IFetchGenreListUsecase>((i) => fetchGenreListMock),
      BindInject<IFetchMovieListByGenre>((i) => fetchMovieListMock),
      BindInject<IGenreRepository>((i) => GenreRepositoryMock()),
      BindInject<IHttpClient>((i) => HttpClientMock()),
    ],
  );
  HomeController sut;

  setUp(() async {
    when(
      fetchGenreListMock(),
    ).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(milliseconds: 200));
        return [GenreEntity(name: '', id: 0)];
      },
    );

    when(
      fetchMovieListMock(genreId: anyNamed('genreId')),
    ).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(milliseconds: 200));
        return MovieListPageEntity(movies: <MoviePreviewEntity>[
          MoviePreviewEntity(
            genreIds: [1],
            posterPath: '',
            title: '',
            id: 1,
          )
        ]);
      },
    );

    sut = HomeModule.to.get<HomeController>();
    sut.setSelectedGenre(GenreEntity(id: 28, name: 'Ação'));
  });
  test('First Test', () {
    expect(sut, isInstanceOf<HomeController>());
  });

  group('fetchGenresUsecase Test', () {
    test('Should call fetchGenresUsecase on init', () {
      expect(sut.isLoadingGenre, isTrue);
      verify(fetchGenreListMock()).called(1);
    });

    test('Should stop loading after fetchGenresUsecase finishes', () async {
      await sut.fetchGenreList();
      expect(sut.isLoadingGenre, isFalse);
    });

    test('genreList should not be empty after fetchGenresUsecase finishes',
        () async {
      await sut.fetchGenreList();
      expect(sut.genreList, isNotEmpty);
    });
  });

  group('fetchMovieListusecase Test', () {
    test('Should call fetchMovieListusecase on init', () {
      verify(fetchMovieListMock(genreId: anyNamed('genreId'))).called(1);
    });

    test('Should stop loading after fetchMovieListusecase finishes', () async {
      await sut.fetchMovieList();
      expect(sut.isLoadingMovie, isFalse);
    });

    test('movieList should not be empty after fetchMovieListusecase finishes',
        () async {
      await sut.fetchMovieList();
      expect(sut.movieList, isNotEmpty);
    });
  });

  group('filter Test', () {
    test('OnChange field should change filterText property', () {
      final text = 'text';

      sut.onChangeFilter(text);

      expect(sut.filterText, equals('text'));
    });
  });
}
