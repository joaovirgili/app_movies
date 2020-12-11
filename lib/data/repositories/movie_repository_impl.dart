import 'package:meta/meta.dart';

import '../../core/key.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/repositories/repositories.dart';
import '../../shared/api/api.dart';
import '../http/http.dart';
import '../models/models.dart';

class MovieRepository implements IMovieRepository {
  final IHttpClient httpClient;

  MovieRepository({@required this.httpClient});

  @override
  Future<MoviePreviewEntity> fetchMovie(FetchMovieParams params) async {
    final queryParameters = {
      'api_key': apiKey,
      'language': params.language ?? Api.defaultLanguage,
    };

    try {
      final httpResponse = await httpClient.get(
        url: '${Api.baseUrl}${Api.movie}${params.id}',
        queryParameters: queryParameters,
      );
      return MoviePreviewModel.fromJson(httpResponse).toEntity();
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
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<MovieListPageEntity> fetchMovieList(
    FetchMovieListParams params,
  ) async {
    try {
      final httpResponse = await httpClient.get(
        url: '${Api.baseUrl}${Api.discover}',
        queryParameters: {
          'api_key': apiKey,
          'language': params.language ?? Api.defaultLanguage,
          'page': params.page,
          'with_genres': params.genreId,
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
