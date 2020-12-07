import 'package:meta/meta.dart';

import '../../core/key.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../shared/api/api.dart';
import '../http/http.dart';
import '../models/genre_model.dart';

class FetchGenreList implements IFetchGenreList {
  final HttpClient httpClient;

  FetchGenreList({@required this.httpClient});

  @override
  Future<List<GenreEntity>> fetch({String language}) async {
    try {
      final httpResponse = await httpClient.get(
        url: '${Api.baseUrl}${Api.genreList}',
        queryParameters: {
          'api_key': apiKey,
          'language': Api.defaultLanguage,
        },
      );

      return httpResponse.containsKey('genres')
          ? (httpResponse['genres'] as List<Map>)
              .map((e) => GenreModel.fromJson(e).toEntity())
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
    }
  }
}
