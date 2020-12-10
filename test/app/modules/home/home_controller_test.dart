import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/app/modules/home/home.dart';

void main() {
  initModule(HomeModule());
  HomeController sut;

  setUp(() {
    sut = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    test('First Test', () {
      expect(sut, isInstanceOf<HomeController>());
    });
  });
}
