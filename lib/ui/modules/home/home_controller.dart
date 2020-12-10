import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/genre_ui_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<GenreUiModel> genreList;

  @observable
  GenreUiModel selectedGenre;

  @observable
  bool isLoadingGenre = true;

  _HomeControllerBase() {
    _fetchGenreList();
  }

  @action
  void setGenreList(List<GenreUiModel> genres) =>
      genreList = genres.asObservable();

  @action
  void setIsLoadingGenre(bool loading) => isLoadingGenre = loading;

  @action
  void setSelectedGenre(GenreUiModel genre) => selectedGenre = genre;

  Future<void> _fetchGenreList() async {
    setIsLoadingGenre(true);
    await Future.delayed(const Duration(seconds: 1));
    setGenreList([
      GenreUiModel(id: 'acao', name: 'Ação'),
      GenreUiModel(id: 'aventura', name: 'Aventura'),
      GenreUiModel(id: 'fantasia', name: 'Fantasia'),
      GenreUiModel(id: 'comedia', name: 'Comédia'),
      GenreUiModel(id: 'terror', name: 'Terror'),
    ]);
    setIsLoadingGenre(false);
  }

  bool isGenreSelected(GenreUiModel genre) => selectedGenre == genre;
}
