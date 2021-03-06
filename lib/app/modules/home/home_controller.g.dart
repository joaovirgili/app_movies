// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(
      fetchGenreListUsecase: i<IFetchGenreListUsecase>(),
      fetchMovieListByGenreUsecase: i<IFetchMovieListByGenre>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$showMoviesComputed;

  @override
  bool get showMovies =>
      (_$showMoviesComputed ??= Computed<bool>(() => super.showMovies,
              name: '_HomeControllerBase.showMovies'))
          .value;

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
  ObservableList<MoviePreviewEntity> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<MoviePreviewEntity> value) {
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

  final _$isLoadingPageAtom = Atom(name: '_HomeControllerBase.isLoadingPage');

  @override
  bool get isLoadingPage {
    _$isLoadingPageAtom.reportRead();
    return super.isLoadingPage;
  }

  @override
  set isLoadingPage(bool value) {
    _$isLoadingPageAtom.reportWrite(value, super.isLoadingPage, () {
      super.isLoadingPage = value;
    });
  }

  final _$isRefreshingAtom = Atom(name: '_HomeControllerBase.isRefreshing');

  @override
  bool get isRefreshing {
    _$isRefreshingAtom.reportRead();
    return super.isRefreshing;
  }

  @override
  set isRefreshing(bool value) {
    _$isRefreshingAtom.reportWrite(value, super.isRefreshing, () {
      super.isRefreshing = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_HomeControllerBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$filterTextAtom = Atom(name: '_HomeControllerBase.filterText');

  @override
  String get filterText {
    _$filterTextAtom.reportRead();
    return super.filterText;
  }

  @override
  set filterText(String value) {
    _$filterTextAtom.reportWrite(value, super.filterText, () {
      super.filterText = value;
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
  void setMovieList(List<MoviePreviewEntity> movies) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMovieList');
    try {
      return super.setMovieList(movies);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMoviesToList(List<MoviePreviewEntity> movies) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addMoviesToList');
    try {
      return super.addMoviesToList(movies);
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
  void setIsLoadingPage(bool loading) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsLoadingPage');
    try {
      return super.setIsLoadingPage(loading);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError(bool loading) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setHasError');
    try {
      return super.setHasError(loading);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsRefreshing(bool refresh) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsRefreshing');
    try {
      return super.setIsRefreshing(refresh);
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
  void setFilterText(String text) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFilterText');
    try {
      return super.setFilterText(text);
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
isLoadingMovie: ${isLoadingMovie},
isLoadingPage: ${isLoadingPage},
isRefreshing: ${isRefreshing},
hasError: ${hasError},
filterText: ${filterText},
showMovies: ${showMovies}
    ''';
  }
}
