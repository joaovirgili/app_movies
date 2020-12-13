// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MovieDetailsController = BindInject(
  (i) => MovieDetailsController(i<IFetchMovieDetails>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsController on _MovieDetailsControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_MovieDetailsControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
