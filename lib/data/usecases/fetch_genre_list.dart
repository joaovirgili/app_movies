import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

class FetchGenreList implements IFetchGenreList {
  @override
  Future<List<GenreEntity>> fetch({String language}) {
    throw UnimplementedError();
  }
}
