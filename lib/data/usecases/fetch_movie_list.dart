import '../../core/key.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../../shared/api/api.dart';

import '../http/http.dart';
import '../http/http_client.dart';

import '../models/models.dart';

class FetchMovieList implements IFetchMovieList {
  final HttpClient httpClient;

  FetchMovieList({this.httpClient});

  @override
  Future<MovieListPageEntity> fetch(FetchMovieListParams params) async {
    try {
      final httpResponse = await httpClient.get(
        url: '${Api.baseUrl}${Api.movie}',
        queryParameters: {
          'api_key': apiKey,
          'language': params.language,
        },
      );

      return MovieListPageModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (e) {
      switch (e) {
        case HttpError.unauthorized:
          throw DomainError.invalidCredentials;
          break;
        case HttpError.notFound:
          throw DomainError.notFound;
          break;
        default:
          throw DomainError.unexpected;
      }
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
