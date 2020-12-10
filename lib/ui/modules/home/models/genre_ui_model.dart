import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GenreUiModel extends Equatable {
  final int id;
  final String name;

  GenreUiModel({@required this.id, @required this.name});

  @override
  List<Object> get props => [id];
}
