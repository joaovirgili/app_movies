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
    final Map<String, dynamic> responseMock = {
      'budget': 63000000,
      'genres': [
        {'id': 18, 'name': 'Drama'}
      ],
      'id': 550,
      'original_language': 'en',
      'original_title': 'Fight Club',
      'overview':
          'Um homem deprimido que sofre de insônia conhece um estranho vendedor chamado Tyler Durden e se vê morando em uma casa suja depois que seu perfeito apartamento é destruído. A dupla forma um clube com regras rígidas onde homens lutam. A parceria perfeita é comprometida quando uma mulher, Marla, atrai a atenção de Tyler.',
      'poster_path': '/ohXr0v9U0TfFu9IXbSDm5zoGV3R.jpg',
      'production_companies': [
        {
          'id': 508,
          'logo_path': '/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png',
          'name': 'Regency Enterprises',
          'origin_country': 'US'
        },
        {
          'id': 711,
          'logo_path': '/tEiIH5QesdheJmDAqQwvtN60727.png',
          'name': 'Fox 2000 Pictures',
          'origin_country': 'US'
        },
        {
          'id': 20555,
          'logo_path': '/hD8yEGUBlHOcfHYbujp71vD8gZp.png',
          'name': 'Taurus Film',
          'origin_country': 'DE'
        },
        {
          'id': 54051,
          'logo_path': null,
          'name': 'Atman Entertainment',
          'origin_country': ''
        },
        {
          'id': 54052,
          'logo_path': null,
          'name': 'Knickerbocker Films',
          'origin_country': 'US'
        },
        {
          'id': 25,
          'logo_path': '/qZCc1lty5FzX30aOCVRBLzaVmcp.png',
          'name': '20th Century Fox',
          'origin_country': 'US'
        },
        {
          'id': 4700,
          'logo_path': '/A32wmjrs9Psf4zw0uaixF0GXfxq.png',
          'name': 'The Linson Company',
          'origin_country': ''
        }
      ],
      'release_date': '1999-10-15',
      'title': 'Clube da Luta',
      'credits': {
        'cast': [
          {
            'adult': false,
            'gender': 2,
            'id': 376,
            'known_for_department': 'Production',
            'name': 'Arnon Milchan',
            'original_name': 'Arnon Milchan',
            'popularity': 1.22,
            'profile_path': '/b2hBExX4NnczNAnLuTBF4kmNhZm.jpg',
            'credit_id': '55731b8192514111610027d7',
            'department': 'Production',
            'job': 'Executive Producer'
          },
        ],
        'crew': [
          {
            'adult': false,
            'gender': 2,
            'id': 376,
            'known_for_department': 'Production',
            'name': 'Arnon Milchan',
            'original_name': 'Arnon Milchan',
            'popularity': 1.22,
            'profile_path': '/b2hBExX4NnczNAnLuTBF4kmNhZm.jpg',
            'credit_id': '55731b8192514111610027d7',
            'department': 'Production',
            'job': 'Executive Producer'
          },
        ]
      }
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
          'append_to_response': 'credits',
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
