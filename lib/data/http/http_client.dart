import 'package:meta/meta.dart';

abstract class HttpClient {
  Future<Map> get({
    @required String url,
    Map<String, String> queryParameters,
  });
}
