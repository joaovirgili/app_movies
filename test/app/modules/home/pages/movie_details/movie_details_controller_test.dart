import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/app/modules/home/home_module.dart';
import 'package:movies/app/modules/home/pages/movie_details/movie_details.dart';
import 'package:movies/data/http/http.dart';
import 'package:movies/domain/entities/entities.dart';
import 'package:movies/domain/helpers/helpers.dart';
import 'package:movies/domain/usecases/usecases.dart';

class FetchMovieDetailsMock extends Mock implements IFetchMovieDetails {}

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  final fetchMovieDetailsMock = FetchMovieDetailsMock();
  final movieId = 550;

  initModule(
    HomeModule(),
    changeBinds: [
      BindInject<IFetchMovieDetails>((i) => fetchMovieDetailsMock),
      BindInject<IHttpClient>((i) => HttpClientMock()),
    ],
  );
  MovieDetailsController sut;

  setUp(() {
    sut = HomeModule.to.get<MovieDetailsController>();
  });

  void mockSuccess() => when(
        fetchMovieDetailsMock(any),
      ).thenAnswer((_) async => MovieDetailsEntity());

  void mockErro() => when(
        fetchMovieDetailsMock(any),
      ).thenThrow(
        DomainError.unexpected,
      );

  group('MovieDetailsController Test', () {
    test('First Test', () {
      expect(sut, isInstanceOf<MovieDetailsController>());
    });

    test('fetchDetails should call FetchMovieDetails usecase', () async {
      mockSuccess();
      await sut.fetchDetails(movieId);
      verify(fetchMovieDetailsMock(movieId)).called(1);
    });

    test('Loading should be false after fetch', () async {
      mockSuccess();
      await sut.fetchDetails(movieId);
      expect(sut.isLoading, isFalse);
    });

    test('movieDetails should not be null after fetch', () async {
      mockSuccess();
      await sut.fetchDetails(movieId);
      expect(sut.movieDetails, isNotNull);
    });

    test('hasError should be true if fetch throws exceptions', () async {
      mockErro();
      await sut.fetchDetails(movieId);
      expect(sut.hasError, isTrue);
    });
  });
}
