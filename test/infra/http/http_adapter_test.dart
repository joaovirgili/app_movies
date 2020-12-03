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
  DioMock client;
  HttpAdapter sut;
  String url;

  setUp(() {
    client = DioMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  group('get', () {
    test('Should call get with correct values', () async {
      await sut.get(url: url);

      verify(client.get(url));
    });
  });
}
