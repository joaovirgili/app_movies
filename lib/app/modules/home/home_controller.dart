import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import 'models/movie_card_ui_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IFetchGenreListUsecase fetchGenreListUsecase;

  @observable
  ObservableList<GenreEntity> genreList = <GenreEntity>[].asObservable();

  @observable
  ObservableList<MovieCardUiModel> movieList =
      <MovieCardUiModel>[].asObservable();

  @observable
  GenreEntity selectedGenre;

  @observable
  bool isLoadingGenre = true;

  @observable
  bool isLoadingMovie = true;

  @computed
  bool get showMovies => !isLoadingGenre && !isLoadingMovie;

  _HomeControllerBase({@required this.fetchGenreListUsecase}) {
    fetchGenreList();
    // fetchMovieList();
  }

  @action
  void setGenreList(List<GenreEntity> genres) =>
      genreList = genres.asObservable();

  @action
  void setMovieList(List<MovieCardUiModel> movies) =>
      movieList = movies.asObservable();

  @action
  void setIsLoadingGenre(bool loading) => isLoadingGenre = loading;

  @action
  void setIsLoadingMovie(bool loading) => isLoadingMovie = loading;

  @action
  void setSelectedGenre(GenreEntity genre) => selectedGenre = genre;

  Future<void> fetchGenreList() async {
    setIsLoadingGenre(true);
    setGenreList(await fetchGenreListUsecase());
    setIsLoadingGenre(false);
  }

  Future<void> fetchMovieList() async {
    setIsLoadingMovie(true);
    await Future.delayed(const Duration(seconds: 1));
    setIsLoadingMovie(false);
  }

  bool isGenreSelected(GenreEntity genre) => selectedGenre == genre;

  List<String> genresToName(List<int> genresId) {
    return genresId
        .map((e) => genreList.firstWhere((element) => element.id == e).name)
        .toList();
  }
}
