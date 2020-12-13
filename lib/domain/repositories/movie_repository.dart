import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class IMovieRepository {
  Future<MovieDetailsEntity> fetchMovie(FetchMovieDetailsParams params);

  Future<MovieListPageEntity> fetchMovieList(FetchMovieListParams param);
}

class FetchMovieDetailsParams extends Equatable {
  final int id;
  final String language;

  FetchMovieDetailsParams({@required this.id, this.language});

  @override
  List<Object> get props => [id, language];
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
