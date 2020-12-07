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
    final dioResponse = await dio.get(
      url,
      queryParameters: queryParameters,
    );

    return _handleResponse(dioResponse);
  }

  Map _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data as Map;
        break;
      case 400:
        throw HttpError.badRequest;
        break;
      case 401:
        throw HttpError.unauthorized;
        break;
      default:
        throw HttpError.serverError;
        break;
    }
  }
}
