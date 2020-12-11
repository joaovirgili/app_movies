// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(fetchGenreListUsecase: i<IFetchGenreListUsecase>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$genreListAtom = Atom(name: '_HomeControllerBase.genreList');

  @override
  ObservableList<GenreEntity> get genreList {
    _$genreListAtom.reportRead();
    return super.genreList;
  }

  @override
  set genreList(ObservableList<GenreEntity> value) {
    _$genreListAtom.reportWrite(value, super.genreList, () {
      super.genreList = value;
    });
  }

  final _$movieListAtom = Atom(name: '_HomeControllerBase.movieList');

  @override
  ObservableList<MovieCardUiModel> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<MovieCardUiModel> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$selectedGenreAtom = Atom(name: '_HomeControllerBase.selectedGenre');

  @override
  GenreEntity get selectedGenre {
    _$selectedGenreAtom.reportRead();
    return super.selectedGenre;
  }

  @override
  set selectedGenre(GenreEntity value) {
    _$selectedGenreAtom.reportWrite(value, super.selectedGenre, () {
      super.selectedGenre = value;
    });
  }

  final _$isLoadingGenreAtom = Atom(name: '_HomeControllerBase.isLoadingGenre');

  @override
  bool get isLoadingGenre {
    _$isLoadingGenreAtom.reportRead();
    return super.isLoadingGenre;
  }

  @override
  set isLoadingGenre(bool value) {
    _$isLoadingGenreAtom.reportWrite(value, super.isLoadingGenre, () {
      super.isLoadingGenre = value;
    });
  }

  final _$isLoadingMovieAtom = Atom(name: '_HomeControllerBase.isLoadingMovie');

  @override
  bool get isLoadingMovie {
    _$isLoadingMovieAtom.reportRead();
    return super.isLoadingMovie;
  }

  @override
  set isLoadingMovie(bool value) {
    _$isLoadingMovieAtom.reportWrite(value, super.isLoadingMovie, () {
      super.isLoadingMovie = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setGenreList(List<GenreEntity> genres) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setGenreList');
    try {
      return super.setGenreList(genres);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovieList(List<MovieCardUiModel> movies) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMovieList');
    try {
      return super.setMovieList(movies);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoadingGenre(bool loading) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsLoadingGenre');
    try {
      return super.setIsLoadingGenre(loading);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoadingMovie(bool loading) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsLoadingMovie');
    try {
      return super.setIsLoadingMovie(loading);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedGenre(GenreEntity genre) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSelectedGenre');
    try {
      return super.setSelectedGenre(genre);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
genreList: ${genreList},
movieList: ${movieList},
selectedGenre: ${selectedGenre},
isLoadingGenre: ${isLoadingGenre},
isLoadingMovie: ${isLoadingMovie}
    ''';
  }
}
