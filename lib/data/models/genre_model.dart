import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class GenreModel {
  final int id;
  final String name;

  GenreModel({@required this.id, @required this.name});

  factory GenreModel.fromJson(Map json) => GenreModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  GenreEntity toEntity() => GenreEntity(id: id, name: name);
}
