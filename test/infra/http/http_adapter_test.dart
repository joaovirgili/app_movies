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
    Map<String, dynamic> queryParameters,
  }) async {
    return dio.get(url, queryParameters: queryParameters);
  }
}

void main() {
  DioMock client;
  HttpAdapter sut;
  String url;

  final queryParametersMock = {'apiKey': ''};

  setUp(() {
    client = DioMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  group('get', () {
    test('Should call get with correct values', () async {
      await sut.get(url: url, queryParameters: queryParametersMock);

      verify(client.get(url, queryParameters: queryParametersMock));
    });
    test('Should call get without queryParameters', () async {
      await sut.get(url: url);

      verify(client.get(url));
    });
  });
}
