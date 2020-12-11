import '../entities/entities.dart';

abstract class IGenreRepository {
  Future<List<GenreEntity>> fetchGenreList({String language});
}
