import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/core/key.dart';
import 'package:movies/data/http/http.dart';
import 'package:movies/data/usecases/usecases.dart';
import 'package:movies/domain/entities/entities.dart';
import 'package:movies/domain/helpers/helpers.dart';
import 'package:movies/domain/usecases/usecases.dart';
import 'package:movies/shared/api/api.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  FetchMovieList sut;
  HttpClient httpClient;
  FetchMovieListParams params;
  Map responseMock;

  PostExpectation mockRequest() => when(httpClient.get(
        url: anyNamed('url'),
        queryParameters: anyNamed('queryParameters'),
      ));

  setUp(() {
    httpClient = HttpClientMock();
    sut = FetchMovieList(httpClient: httpClient);
    params = FetchMovieListParams(language: 'pt-br');
    responseMock = {
      'page': 1,
      'results': [
        {
          'backdrop_path': '/jeAQdDX9nguP6YOX6QSWKDPkbBo.jpg',
          'genre_ids': [28, 14, 878],
          'id': 590706,
          'title': 'Jiu Jitsu'
        }
      ],
      'total_pages': 500,
      'total_results': 10000
    };
  });

  test('Should call HttpClient get with correct URL', () async {
    mockRequest().thenAnswer((_) async => responseMock);

    await sut.fetch(params);

    verify(httpClient.get(
      url: '${Api.baseUrl}${Api.movie}',
      queryParameters: {
        'api_key': apiKey,
        'language': params.language,
      },
    ));
  });

  test('Should return MovieListPageEntity if HttpClient returns 200', () async {
    mockRequest().thenAnswer((_) async => responseMock);

    final movieListPage = await sut.fetch(params);

    expect(movieListPage, isA<MovieListPageEntity>());
  });

  test('Should return Unexpected if HttpClient returns 200 with no data',
      () async {
    mockRequest().thenAnswer((_) async => null);

    final future = sut.fetch(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw Unauthorized if HttpClient returns 401', () async {
    mockRequest().thenThrow(HttpError.unauthorized);

    final future = sut.fetch(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should throw NotFound if HttpClient returns 404', () async {
    mockRequest().thenThrow(HttpError.notFound);

    final future = sut.fetch(params);

    expect(future, throwsA(DomainError.notFound));
  });

  test('Should throw Unexpected if HttpClient returns any other error',
      () async {
    mockRequest().thenThrow(Exception());

    final future = sut.fetch(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw Unauthorized if HttpClient returns 500', () async {
    mockRequest().thenThrow(HttpError.serverError);

    final future = sut.fetch(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
