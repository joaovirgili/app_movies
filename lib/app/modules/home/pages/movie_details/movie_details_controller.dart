import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'movie_details_controller.g.dart';

@Injectable()
class MovieDetailsController = _MovieDetailsControllerBase
    with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store {
  final IFetchMovieDetails fetchMovieDetails;
  MovieDetailsEntity movieDetails;

  @observable
  bool isLoading = true;

  @observable
  bool hasError = false;

  _MovieDetailsControllerBase(this.fetchMovieDetails);

  @action
  void setIsLoading(bool l) => isLoading = l;

  @action
  void setHasError(bool l) => hasError = l;

  Future<void> fetchDetails(int movieId) async {
    setIsLoading(true);
    setHasError(false);
    try {
      movieDetails = await fetchMovieDetails(movieId);
    } catch (e) {
      setHasError(true);
    }
    setIsLoading(false);
  }
}
