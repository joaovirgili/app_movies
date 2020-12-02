import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class IFetchMovie {
  Future<MovieEntity> fetch(FetchMovieParams params);
}

class FetchMovieParams {
  final int id;
  final String language;

  FetchMovieParams({@required this.id, this.language});
}
