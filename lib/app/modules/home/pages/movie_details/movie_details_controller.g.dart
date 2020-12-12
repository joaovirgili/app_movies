// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MovieDetailsController = BindInject(
  (i) => MovieDetailsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsController on _MovieDetailsControllerBase, Store {
  final _$valueAtom = Atom(name: '_MovieDetailsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_MovieDetailsControllerBaseActionController =
      ActionController(name: '_MovieDetailsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MovieDetailsControllerBaseActionController
        .startAction(name: '_MovieDetailsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MovieDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
