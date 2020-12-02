import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class MovieModel {
  final String title;
  final int id;
  final double voteAverage;

  MovieModel({
    @required this.title,
    @required this.id,
    @required this.voteAverage,
  });

  factory MovieModel.fromJson(Map movie) => MovieModel(
        title: movie['title'] as String,
        id: movie['id'] as int,
        voteAverage: movie['voteAverage'] as double,
      );

  MovieEntity toEntity() => MovieEntity(
        id: id,
        title: title,
        voteAverage: voteAverage,
      );
}
