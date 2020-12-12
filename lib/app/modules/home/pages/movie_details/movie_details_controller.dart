import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'movie_details_controller.g.dart';

@Injectable()
class MovieDetailsController = _MovieDetailsControllerBase
    with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
