import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../key/key.dart';
import '../../shared/api/api.dart';
import '../http/http.dart';
import '../models/movie_model.dart';

class FetchMovie implements IFetchMovie {
  final HttpClient httpClient;
  final String path;

  FetchMovie({@required this.httpClient, @required this.path});

  @override
  Future<MovieEntity> fetch(FetchMovieParams params) async {
    final queryParameters = {
      'api_key': apiKey,
      'language': params.language,
    };

    try {
      final httpResponse = await httpClient.get(
        url: '${Api.baseUrl}$path${params.id}',
        queryParameters: queryParameters,
      );
      return MovieModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (e) {
      switch (e) {
        case HttpError.notFound:
          throw DomainError.notFound;
          break;
        case HttpError.unauthorized:
          throw DomainError.invalidCredentials;
          break;
        default:
          throw DomainError.unexpected;
      }
    }
  }
}
