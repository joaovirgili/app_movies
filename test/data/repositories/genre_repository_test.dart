import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:movies/core/key.dart';
import 'package:movies/data/http/http.dart';
import 'package:movies/data/repositories/repositories.dart';
import 'package:movies/domain/entities/entities.dart';
import 'package:movies/domain/helpers/helpers.dart';
import 'package:movies/shared/api/api.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  HttpClientMock httpClient;
  GenreRepository sut;

  setUp(() {
    httpClient = HttpClientMock();
    sut = GenreRepository(httpClient: httpClient);
  });

  group('Fetch genre list', () {
    final url = '${Api.baseUrl}${Api.genreList}';
    final Map<dynamic, dynamic> responseMock = {
      'genres': [
        {'id': 28, 'name': 'Ação'},
        {'id': 12, 'name': 'Aventura'},
      ],
    };

    PostExpectation mockRequest() => when(httpClient.get(
          url: url,
          queryParameters: anyNamed('queryParameters'),
        ));

    test('Should call HttpClient get with correct URL', () async {
      mockRequest().thenAnswer((_) async => responseMock);

      await sut.fetchGenreList();

      verify(httpClient.get(
        url: url,
        queryParameters: {
          'api_key': apiKey,
          'language': Api.defaultLanguage,
        },
      ));
    });

    test('Should return list of GenreEntity if HttpClient returns 200',
        () async {
      mockRequest().thenAnswer((_) async => responseMock);

      final genreList = await sut.fetchGenreList();

      expect(genreList, isA<List<GenreEntity>>());
      expect(genreList, isNotEmpty);
    });

    test('Should return null if HttpClient returns 200 with no data', () async {
      mockRequest().thenAnswer((_) async => {});

      final genreList = await sut.fetchGenreList();

      expect(genreList, isNull);
    });

    test('Should throw Unauthorized if HttpClient returns 401', () async {
      mockRequest().thenThrow(HttpError.unauthorized);

      final future = sut.fetchGenreList();

      expect(future, throwsA(DomainError.invalidCredentials));
    });

    test('Should throw NotFound if HttpClient returns 404', () async {
      mockRequest().thenThrow(HttpError.notFound);

      final future = sut.fetchGenreList();

      expect(future, throwsA(DomainError.notFound));
    });

    test('Should throw Unauthorized if HttpClient returns 500', () async {
      mockRequest().thenThrow(HttpError.serverError);

      final future = sut.fetchGenreList();

      expect(future, throwsA(DomainError.unexpected));
    });

    test('Should throw Unexpected if HttpClient returns any other error',
        () async {
      mockRequest().thenThrow(Exception());

      final future = sut.fetchGenreList();

      expect(future, throwsA(DomainError.unexpected));
    });
  });
}
