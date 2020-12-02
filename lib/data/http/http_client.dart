import 'package:meta/meta.dart';

abstract class HttpClient {
  Future<void> get({
    @required String url,
    Map<String, String> queryParameters,
  });
}
