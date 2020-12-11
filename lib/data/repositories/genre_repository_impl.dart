import 'package:meta/meta.dart';

import '../../core/key.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/repositories/repositories.dart';
import '../../shared/api/api.dart';
import '../http/http.dart';
import '../models/models.dart';

class GenreRepository implements IGenreRepository {
  final HttpClient httpClient;

  GenreRepository({@required this.httpClient});

  @override
  Future<List<GenreEntity>> fetchGenreList({String language}) async {
    try {
      final httpResponse = await httpClient.get(
        url: '${Api.baseUrl}${Api.genreList}',
        queryParameters: {
          'api_key': apiKey,
          'language': Api.defaultLanguage,
        },
      );

      return httpResponse.containsKey('genres')
          ? (httpResponse['genres'] as List)
              .map((e) => GenreModel.fromJson(e as Map).toEntity())
              .toList()
          : null;
    } on HttpError catch (error) {
      switch (error) {
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
