import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class IFetchMovie {
  Future<MovieEntity> fetch(FetchMovieParams params);
}

class FetchMovieParams {
  final int id;

  FetchMovieParams({@required this.id});
}
