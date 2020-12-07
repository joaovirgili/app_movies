import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/data/http/http.dart';

import 'package:movies/infra/http/http.dart';

class DioMock extends Mock implements Dio {}

void main() {
  DioMock client;
  HttpAdapter sut;
  String url;

  final queryParametersMock = {'apiKey': ''};
  final dataMock = {'a': 'a'};

  setUp(() {
    client = DioMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  PostExpectation mockRequest({Map<String, dynamic> query}) => when(
      client.get(any, queryParameters: query, options: anyNamed('options')));

  Future<void> mockResponse(
    int statusCode, {
    Map<String, dynamic> query,
    Map data,
  }) async {
    mockRequest(query: query).thenAnswer((_) async => Response(
          statusCode: statusCode,
          data: data,
        ));
  }

  group('get', () {
    test('Should call get with correct values', () async {
      mockResponse(200, query: queryParametersMock);
      await sut.get(url: url, queryParameters: queryParametersMock);

      verify(client.get(url, queryParameters: queryParametersMock));
    });

    test('Should call get without queryParameters', () async {
      mockResponse(200);
      await sut.get(url: url);

      verify(client.get(url));
    });

    test('Should return data if get returns 200', () async {
      mockResponse(200, data: dataMock);

      final data = await sut.get(url: url);

      expect(data, {'a': 'a'});
    });

    test('Should return null if get returns 200 with no data', () async {
      mockResponse(200);

      final data = await sut.get(url: url);

      expect(data, null);
    });

    test('Should return BadRequest if get returns 400', () async {
      mockResponse(400);

      final future = sut.get(url: url);

      expect(future, throwsA(HttpError.badRequest));
    });

    test('Should return Unauthorized if get returns 401', () async {
      mockResponse(401);

      final future = sut.get(url: url);

      expect(future, throwsA(HttpError.unauthorized));
    });

    test('Should return NotFound if get returns 404', () async {
      mockResponse(404);

      final future = sut.get(url: url);

      expect(future, throwsA(HttpError.notFound));
    });
  });
}
