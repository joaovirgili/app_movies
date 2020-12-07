import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class GenreModel {
  final String id;
  final String name;

  GenreModel({@required this.id, @required this.name});

  factory GenreModel.fromJson(Map json) => GenreModel(
        id: json['id'] as String,
        name: json['name'] as String,
      );

  GenreEntity toEntity() => GenreEntity(id: id, name: name);
}
