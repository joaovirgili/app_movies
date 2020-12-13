import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/core/key.dart';

import 'package:movies/data/http/http.dart';
import 'package:movies/data/repositories/movie_repository_impl.dart';

import 'package:movies/domain/entities/entities.dart';
import 'package:movies/domain/helpers/helpers.dart';
import 'package:movies/domain/repositories/repositories.dart';

import 'package:movies/shared/api/api.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  IHttpClient httpClient;
  MovieRepository sut;

  setUp(() {
    httpClient = HttpClientMock();
    sut = MovieRepository(httpClient: httpClient);
  });

  group('Fetch movie', () {
    final params = FetchMovieDetailsParams(id: 550, language: 'pt-br');
    final responseMock = {
      'title': faker.person.name(),
      'id': 550,
      'voteAverage': 8.5,
    };
    final url = '${Api.baseUrl}${Api.movie}${params.id}';

    PostExpectation mockRequest() => when(httpClient.get(
          url: url,
          queryParameters: anyNamed('queryParameters'),
        ));

    test('Should call HttpClient get with correct URL', () async {
      mockRequest().thenAnswer((_) async => responseMock);

      await sut.fetchMovie(params);

      verify(httpClient.get(
        url: url,
        queryParameters: {
          'api_key': apiKey,
          'language': params.language,
        },
      ));
    });

    test('Should return Movie if HttpClient returns 200', () async {
      mockRequest().thenAnswer((_) async => responseMock);

      final movie = await sut.fetchMovie(params);

      expect(movie.id, responseMock['id']);
    });

    test('Should throw Unauthorized if HttpClient returns 401', () async {
      mockRequest().thenThrow(HttpError.unauthorized);

      final future = sut.fetchMovie(params);

      expect(future, throwsA(DomainError.invalidCredentials));
    });

    test('Should throw NotFound if HttpClient returns 404', () async {
      mockRequest().thenThrow(HttpError.notFound);

      final future = sut.fetchMovie(params);

      expect(future, throwsA(DomainError.notFound));
    });

    test('Should throw Unexpected if HttpClient returns any other error',
        () async {
      mockRequest().thenThrow(Exception());

      final future = sut.fetchMovie(params);

      expect(future, throwsA(DomainError.unexpected));
    });

    test('Should throw Unauthorized if HttpClient returns 500', () async {
      mockRequest().thenThrow(HttpError.serverError);

      final future = sut.fetchMovie(params);

      expect(future, throwsA(DomainError.unexpected));
    });
  });

  group('Fetch movie list', () {
    final params = FetchMovieListParams(language: 'pt-br');
    final responseMock = {
      'page': 1,
      'results': [
        {
          'poster_path': '/jeAQdDX9nguP6YOX6QSWKDPkbBo.jpg',
          'genre_ids': [28, 14, 878],
          'id': 590706,
          'title': 'Jiu Jitsu'
        }
      ],
      'total_pages': 500,
      'total_results': 10000
    };
    final url = '${Api.baseUrl}${Api.discover}';

    PostExpectation mockRequest() => when(httpClient.get(
          url: url,
          queryParameters: anyNamed('queryParameters'),
        ));

    test('Should call HttpClient get with correct URL', () async {
      mockRequest().thenAnswer((_) async => responseMock);

      await sut.fetchMovieList(params);

      verify(httpClient.get(
        url: url,
        queryParameters: {
          'api_key': apiKey,
          'language': params.language,
          'page': params.page,
          'with_genres': params.genreId,
        },
      ));
    });

    test('Should return MovieListPageEntity if HttpClient returns 200',
        () async {
      mockRequest().thenAnswer((_) async => responseMock);

      final movieListPage = await sut.fetchMovieList(params);

      expect(movieListPage, isA<MovieListPageEntity>());
    });

    test('Should return Unexpected if HttpClient returns 200 with no data',
        () async {
      mockRequest().thenAnswer((_) async => null);

      final future = sut.fetchMovieList(params);

      expect(future, throwsA(DomainError.unexpected));
    });

    test('Should throw Unauthorized if HttpClient returns 401', () async {
      mockRequest().thenThrow(HttpError.unauthorized);

      final future = sut.fetchMovieList(params);

      expect(future, throwsA(DomainError.invalidCredentials));
    });

    test('Should throw NotFound if HttpClient returns 404', () async {
      mockRequest().thenThrow(HttpError.notFound);

      final future = sut.fetchMovieList(params);

      expect(future, throwsA(DomainError.notFound));
    });

    test('Should throw Unexpected if HttpClient returns any other error',
        () async {
      mockRequest().thenThrow(Exception());

      final future = sut.fetchMovieList(params);

      expect(future, throwsA(DomainError.unexpected));
    });

    test('Should throw Unauthorized if HttpClient returns 500', () async {
      mockRequest().thenThrow(HttpError.serverError);

      final future = sut.fetchMovieList(params);

      expect(future, throwsA(DomainError.unexpected));
    });
  });
}
