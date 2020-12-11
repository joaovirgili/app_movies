import 'package:meta/meta.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

abstract class IFetchGenreListUsecase {
  Future<List<GenreEntity>> call();
}

class FetchGenreListUsecase extends IFetchGenreListUsecase {
  final IGenreRepository genreRepository;

  FetchGenreListUsecase({@required this.genreRepository});

  Future<List<GenreEntity>> call() {
    return genreRepository.fetchGenreList();
  }
}
