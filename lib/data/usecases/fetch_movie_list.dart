import '../../domain/entities/entities.dart';
import '../../domain/usecases/fetch_movie_list_usecase.dart';
import '../http/http_client.dart';

class FetchMovieList implements IFetchMovieList {
  final HttpClient httpClient;

  FetchMovieList({this.httpClient});

  @override
  Future<MovieListPageEntity> fetch(FetchMovieListParams params) {
    // TODO: implement fetch
    throw UnimplementedError();
  }
}
