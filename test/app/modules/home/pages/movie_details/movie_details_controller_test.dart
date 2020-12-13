import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/app/modules/home/home_module.dart';
import 'package:movies/app/modules/home/pages/movie_details/movie_details.dart';
import 'package:movies/data/http/http.dart';
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

  group('MovieDetailsController Test', () {
    test('First Test', () {
      expect(sut, isInstanceOf<MovieDetailsController>());
    });

    test('fetchDetails should call FetchMovieDetails usecase', () async {
      await sut.fetchDetails(movieId);
      verify(fetchMovieDetailsMock(movieId)).called(1);
    });
  });
}
