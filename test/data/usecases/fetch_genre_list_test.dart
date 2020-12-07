import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/core/key.dart';

import 'package:movies/data/http/http.dart';
import 'package:movies/data/usecases/fetch_genre_list.dart';
import 'package:movies/shared/api/api.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  HttpClientMock httpClient;
  Map responseMock;
  FetchGenreList sut;

  setUp(() {
    httpClient = HttpClientMock();

    responseMock = {
      'genres': [
        {'id': 28, 'name': 'Ação'},
        {'id': 12, 'name': 'Aventura'},
      ],
    };
    sut = FetchGenreList(httpClient: httpClient);
  });

  PostExpectation mockRequest() => when(httpClient.get(
        url: anyNamed('url'),
        queryParameters: anyNamed('queryParameters'),
      ));

  test('Should call HttpClient get with correct URL', () async {
    mockRequest().thenAnswer((_) async => responseMock);

    await sut.fetch();

    verify(httpClient.get(
      url: '${Api.baseUrl}${Api.genreList}',
      queryParameters: {
        'api_key': apiKey,
        'language': Api.defaultLanguage,
      },
    ));
  });
}
