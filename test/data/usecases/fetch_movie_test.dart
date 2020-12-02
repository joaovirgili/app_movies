import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

class FetchCars {
  final HttpClient httpClient;
  final String url;

  FetchCars({@required this.httpClient, @required this.url});
  Future<void> fetch() async {
    httpClient.get(url: url);
  }
}

abstract class HttpClient {
  Future<void> get({@required String url}) async {}
}

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  test('Should call HttpClient get with correct URL', () async {
    final httpClient = HttpClientMock();
    final url = faker.internet.httpUrl();
    final sut = FetchCars(httpClient: httpClient, url: url);

    await sut.fetch();

    verify(httpClient.get(url: url));
  });
}
