import 'package:meta/meta.dart';

import '../../core/key.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../shared/api/api.dart';
import '../http/http.dart';

class FetchGenreList implements IFetchGenreList {
  final HttpClient httpClient;

  FetchGenreList({@required this.httpClient});

  @override
  Future<List<GenreEntity>> fetch({String language}) async {
    await httpClient.get(
      url: '${Api.baseUrl}${Api.genreList}',
      queryParameters: {
        'api_key': apiKey,
        'language': Api.defaultLanguage,
      },
    );

    return null;
  }
}
