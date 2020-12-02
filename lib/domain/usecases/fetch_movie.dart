import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class IFetchMovie {
  Future<MovieEntity> fetch({@required String id});
}
