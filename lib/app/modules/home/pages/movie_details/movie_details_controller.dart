import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../domain/usecases/usecases.dart';

part 'movie_details_controller.g.dart';

@Injectable()
class MovieDetailsController = _MovieDetailsControllerBase
    with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store {
  final IFetchMovieDetails fetchMovieDetails;

  @observable
  bool isLoading = true;

  _MovieDetailsControllerBase(this.fetchMovieDetails);

  Future<void> fetchDetails(int movieId) async {
    return fetchMovieDetails(movieId);
  }
}
