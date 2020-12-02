import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

import 'package:movies/domain/usecases/usecases.dart';
import 'package:movies/shared/api/api.dart';

class FetchMovies {
  final HttpClient httpClient;
  final String path;

  FetchMovies({@required this.httpClient, @required this.path});

  Future<void> fetch(FetchMovieParams params) async {
    httpClient.get(url: '${Api.baseUrl}/$path/${params.id}');
  }
}

abstract class HttpClient {
  Future<void> get({@required String url}) async {}
}

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  FetchMovies sut;
  HttpClient httpClient;
  String path;

  setUp(() {
    httpClient = HttpClientMock();
    path = 'movie';
    sut = FetchMovies(httpClient: httpClient, path: path);
  });
  test('Should call HttpClient get with correct URL', () async {
    final params = FetchMovieParams(id: 550);
    await sut.fetch(params);

    verify(httpClient.get(url: '${Api.baseUrl}/$path/${params.id}'));
  });
}
