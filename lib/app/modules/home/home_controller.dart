import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'models/genre_ui_model.dart';
import 'models/movie_card_ui_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<GenreUiModel> genreList;

  @observable
  ObservableList<MovieCardUiModel> movieList = [
    MovieCardUiModel(
      id: 590706,
      genreIds: [0, 2, 4],
      backdropPath: '/jeAQdDX9nguP6YOX6QSWKDPkbBo.jpg',
      posterPath: '/eLT8Cu357VOwBVTitkmlDEg32Fs.jpg',
      title: 'Jiu Jitsu',
    ),
    MovieCardUiModel(
      id: 590706,
      genreIds: [0, 2, 4],
      backdropPath: '/jeAQdDX9nguP6YOX6QSWKDPkbBo.jpg',
      posterPath: '/eLT8Cu357VOwBVTitkmlDEg32Fs.jpg',
      title: 'Jiu Jitsu',
    ),
    MovieCardUiModel(
      id: 590706,
      genreIds: [0, 2, 4],
      backdropPath: '/jeAQdDX9nguP6YOX6QSWKDPkbBo.jpg',
      posterPath: '/eLT8Cu357VOwBVTitkmlDEg32Fs.jpg',
      title: 'Jiu Jitsu',
    ),
    MovieCardUiModel(
      id: 590706,
      genreIds: [0, 2, 4],
      backdropPath: '/jeAQdDX9nguP6YOX6QSWKDPkbBo.jpg',
      posterPath: '/eLT8Cu357VOwBVTitkmlDEg32Fs.jpg',
      title: 'Jiu Jitsu',
    ),
  ].asObservable();

  @observable
  GenreUiModel selectedGenre;

  @observable
  bool isLoadingGenre = true;

  @observable
  bool isLoadingMovie = true;

  _HomeControllerBase() {
    // fetchGenreList();
    // fetchMovieList();
  }

  @action
  void setGenreList(List<GenreUiModel> genres) =>
      genreList = genres.asObservable();

  @action
  void setMovieList(List<MovieCardUiModel> movies) =>
      movieList = movies.asObservable();

  @action
  void setIsLoadingGenre(bool loading) => isLoadingGenre = loading;

  @action
  void setIsLoadingMovie(bool loading) => isLoadingMovie = loading;

  @action
  void setSelectedGenre(GenreUiModel genre) => selectedGenre = genre;

  Future<void> fetchGenreList() async {
    setIsLoadingGenre(true);
    await Future.delayed(const Duration(seconds: 1));
    setGenreList([
      GenreUiModel(id: 0, name: 'Ação'),
      GenreUiModel(id: 1, name: 'Aventura'),
      GenreUiModel(id: 2, name: 'Fantasia'),
      GenreUiModel(id: 3, name: 'Comédia'),
      GenreUiModel(id: 4, name: 'Terror'),
    ]);
    setIsLoadingGenre(false);
  }

  Future<void> fetchMovieList() async {
    setIsLoadingMovie(true);
    await Future.delayed(const Duration(seconds: 1));
    setMovieList([
      MovieCardUiModel(
        id: 590706,
        genreIds: [0, 2, 4],
        backdropPath: '/jeAQdDX9nguP6YOX6QSWKDPkbBo.jpg',
        posterPath: '/eLT8Cu357VOwBVTitkmlDEg32Fs.jpg',
        title: 'Jiu Jitsu',
      ),
    ]);
    setIsLoadingMovie(false);
  }

  bool isGenreSelected(GenreUiModel genre) => selectedGenre == genre;

  List<String> genresToName(List<int> genresId) => genresId
      .map((e) => genreList.firstWhere((element) => element.id == e).name)
      .toList();
}
