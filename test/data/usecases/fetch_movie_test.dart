import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/data/http/http.dart';
import 'package:movies/data/usecases/usecases.dart';
import 'package:movies/domain/helpers/helpers.dart';

import 'package:movies/domain/usecases/usecases.dart';
import 'package:movies/key/key.dart';
import 'package:movies/shared/api/api.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  FetchMovies sut;
  HttpClient httpClient;

  setUp(() {
    httpClient = HttpClientMock();
    sut = FetchMovies(httpClient: httpClient, path: Api.movie);
  });
  test('Should call HttpClient get with correct URL', () async {
    final params = FetchMovieParams(id: 550, language: 'pt-br');
    await sut.fetch(params);

    verify(httpClient.get(
      url: '${Api.baseUrl}${Api.movie}${params.id}',
      queryParameters: {
        'api_key': apiKey,
        'language': params.language,
      },
    ));
  });

  test('Should throw Unauthorized if HttpClient returns 401', () async {
    when(httpClient.get(
      url: anyNamed('url'),
      queryParameters: anyNamed('queryParameters'),
    )).thenThrow(HttpError.unauthorized);

    final params = FetchMovieParams(id: 550, language: 'pt-br');
    final future = sut.fetch(params);

    expect(future, throwsA(DomainError.unauthorized));
  });
}
