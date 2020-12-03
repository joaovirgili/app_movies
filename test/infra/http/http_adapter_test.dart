import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/data/http/http.dart';

class DioMock extends Mock implements Dio {}

class HttpAdapter implements HttpClient {
  final Dio dio;

  HttpAdapter(this.dio);

  @override
  Future<Map> get({
    @required String url,
    Map<String, dynamic> queryParameters,
  }) async {
    final dioResponse = await dio.get(url, queryParameters: queryParameters);
    return dioResponse.data as Map;
  }
}

void main() {
  DioMock client;
  HttpAdapter sut;
  String url;

  final queryParametersMock = {'apiKey': ''};
  final responseMock = {'a': 'a'};

  setUp(() {
    client = DioMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  PostExpectation mockRequest({Map<String, dynamic> query}) =>
      when(client.get(any, queryParameters: query));

  Future<Response<dynamic>> mockResponse(Invocation _) async =>
      Response(data: responseMock);

  group('get', () {
    test('Should call get with correct values', () async {
      mockRequest(query: queryParametersMock).thenAnswer(mockResponse);
      await sut.get(url: url, queryParameters: queryParametersMock);

      verify(client.get(url, queryParameters: queryParametersMock));
    });

    test('Should call get without queryParameters', () async {
      mockRequest().thenAnswer(mockResponse);
      await sut.get(url: url);

      verify(client.get(url));
    });

    test('Should return data if get returns 200', () async {
      mockRequest().thenAnswer(mockResponse);

      final data = await sut.get(url: url);

      expect(data, {'a': 'a'});
    });

    test('Should return null if get returns 200 with no data', () async {
      mockRequest().thenAnswer((_) async => Response());

      final data = await sut.get(url: url);

      expect(data, null);
    });
  });
}
