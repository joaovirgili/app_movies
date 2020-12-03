import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

class HttpAdapter {
  final Dio dio;

  HttpAdapter(this.dio);

  Future<void> get({
    @required String url,
    Map<String, String> queryParameters,
  }) async {
    return dio.get(url);
  }
}

void main() {
  group('get', () {
    test('Should call get with correct values', () async {
      final client = DioMock();
      final sut = HttpAdapter(client);
      final url = faker.internet.httpUrl();

      await sut.get(url: url);

      verify(client.get(url));
    });
  });
}
