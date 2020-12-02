import 'package:meta/meta.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../key/key.dart';
import '../../shared/api/api.dart';
import '../http/http.dart';

class FetchMovies {
  final HttpClient httpClient;
  final String path;

  FetchMovies({@required this.httpClient, @required this.path});

  Future<void> fetch(FetchMovieParams params) async {
    final queryParameters = {
      'api_key': apiKey,
      'language': params.language,
    };

    try {
      httpClient.get(
        url: '${Api.baseUrl}$path${params.id}',
        queryParameters: queryParameters,
      );
    } on HttpError catch (e) {
      switch (e) {
        case HttpError.notFound:
          throw DomainError.notFound;
          break;
        default:
          throw DomainError.unexpected;
      }
    }
  }
}
