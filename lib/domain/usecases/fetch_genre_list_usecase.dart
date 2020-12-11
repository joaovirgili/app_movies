import 'package:meta/meta.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

class FetchGenreListUsecase {
  final IGenreRepository genreRepository;

  FetchGenreListUsecase({@required this.genreRepository});

  Future<List<GenreEntity>> call() {
    return genreRepository.fetchGenreList();
  }
}
