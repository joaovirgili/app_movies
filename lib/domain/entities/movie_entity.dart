import 'package:meta/meta.dart';

class MovieEntity {
  final int id;
  final String title;
  final double voteAverage;

  MovieEntity({
    @required this.id,
    @required this.title,
    @required this.voteAverage,
  });
}
