import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class IMovieRepository {
  Future<MoviePreviewEntity> fetchMovie(FetchMovieParams params);

  Future<MovieListPageEntity> fetchMovieList(FetchMovieListParams param);
}

class FetchMovieParams {
  final int id;
  final String language;

  FetchMovieParams({@required this.id, this.language});
}

class FetchMovieListParams extends Equatable {
  final String language;
  final int genreId;
  final int page;
  final bool includeAdult;

  FetchMovieListParams({
    this.language,
    this.genreId,
    this.page = 1,
    this.includeAdult = false,
  });

  @override
  List<Object> get props => [language, genreId, page, includeAdult];
}
