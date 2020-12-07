import '../entities/entities.dart';

abstract class IFetchGenreList {
  Future<List<GenreEntity>> fetch({String language});
}
