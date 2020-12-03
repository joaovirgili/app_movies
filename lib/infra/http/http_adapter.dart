import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/http/http.dart';

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
