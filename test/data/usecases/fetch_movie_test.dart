import 'package:faker/faker.dart';
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
  FetchMovie sut;
  HttpClient httpClient;
  FetchMovieParams params;
  Map responseMock;

  PostExpectation mockRequest() => when(httpClient.get(
        url: anyNamed('url'),
        queryParameters: anyNamed('queryParameters'),
      ));

  setUp(() {
    httpClient = HttpClientMock();
    sut = FetchMovie(httpClient: httpClient, path: Api.movie);
    params = FetchMovieParams(id: 550, language: 'pt-br');
    responseMock = {
      'title': faker.person.name(),
      'id': faker.randomGenerator.integer(550, min: 2),
      'voteAverage': 8.5,
    };
  });

  test('Should return Movie if HttpClient returns 200', () async {
    mockRequest().thenAnswer((_) async => responseMock);

    final movie = await sut.fetch(params);

    expect(movie.id, responseMock['id']);
  });
  test('Should call HttpClient get with correct URL', () async {
    mockRequest().thenAnswer((_) async => responseMock);

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
