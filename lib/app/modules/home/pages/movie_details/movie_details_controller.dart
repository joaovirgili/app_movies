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

  List<String> getDirectors() {
    if (movieDetails == null) {
      return <String>[];
    }
    movieDetails.directors.sort(byPopularity);
    final vip = movieDetails.directors.length > 5
        ? movieDetails.directors.getRange(0, 4)
        : movieDetails.directors;

    return vip.map((e) => e.name).toList();
  }

  int byPopularity(MemberEntity a, MemberEntity b) {
    return a.popularity > b.popularity ? -1 : 1;
  }
}
