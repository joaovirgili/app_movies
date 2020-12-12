import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store implements Disposable {
  final IFetchGenreListUsecase fetchGenreListUsecase;
  final IFetchMovieListByGenre fetchMovieListByGenreUsecase;
  ReactionDisposer filterReaction;
  MovieListPageEntity movieListPage;

  @observable
  ObservableList<GenreEntity> genreList = <GenreEntity>[].asObservable();

  @observable
  ObservableList<MoviePreviewEntity> movieList =
      <MoviePreviewEntity>[].asObservable();

  @observable
  GenreEntity selectedGenre;

  @observable
  bool isLoadingGenre = true;

  @observable
  bool isLoadingMovie = true;

  @observable
  bool isLoadingPage = false;

  @observable
  String filterText = '';

  @computed
  bool get showMovies => !isLoadingGenre && !isLoadingMovie;

  bool get hasNextPage => movieListPage.totalPages > movieListPage.page;

  _HomeControllerBase({
    @required this.fetchGenreListUsecase,
    @required this.fetchMovieListByGenreUsecase,
  }) {
    fetchGenreList().then((_) => fetchMovieList());
  }

  @action
  void setGenreList(List<GenreEntity> genres) =>
      genreList = genres.asObservable();

  @action
  void setMovieList(List<MoviePreviewEntity> movies) =>
      movieList = movies.asObservable();

  @action
  void addMoviesToList(List<MoviePreviewEntity> movies) =>
      movieList.addAll(movies);

  @action
  void setIsLoadingGenre(bool loading) => isLoadingGenre = loading;

  @action
  void setIsLoadingMovie(bool loading) => isLoadingMovie = loading;

  @action
  void setIsLoadingPage(bool loading) => isLoadingPage = loading;

  @action
  void setSelectedGenre(GenreEntity genre) => selectedGenre = genre;

  @action
  void setFilterText(String text) => filterText = text;

  Future<void> fetchGenreList() async {
    setIsLoadingGenre(true);
    setGenreList(await fetchGenreListUsecase());
    setSelectedGenre(genreList[0]);
    setIsLoadingGenre(false);
  }

  Future<void> fetchMovieList() async {
    setIsLoadingMovie(true);
    movieListPage = await fetchMovieListByGenreUsecase(
      genreId: selectedGenre.id,
    );
    setMovieList(movieListPage.movies);
    setIsLoadingMovie(false);
  }

  Future<void> fetchMovieListNextPage() async {
    setIsLoadingPage(true);
    movieListPage.page++;
    movieListPage = await fetchMovieListByGenreUsecase(
      genreId: selectedGenre.id,
      page: movieListPage.page,
    );
    addMoviesToList(movieListPage.movies);
    setIsLoadingPage(false);
  }

  bool isGenreSelected(GenreEntity genre) => selectedGenre == genre;

  List<String> genresToName(List<int> genreId) {
    return genreId
        .map((e) => genreList.firstWhere((element) => element.id == e).name)
        .toList();
  }

  void onChangeFilter(String text) {
    setFilterText(text);
  }

  void onChangeGenre(GenreEntity genre) {
    setSelectedGenre(genre);
    fetchMovieList();
  }

  bool filterByTitle(MoviePreviewEntity movie) =>
      movie.title.toLowerCase().contains(filterText.toLowerCase());

  @override
  void dispose() {
    filterReaction();
  }
}
