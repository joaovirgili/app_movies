import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../data/http/http_client.dart';
import '../../../data/repositories/genre_repository_impl.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../infra/dio/dio.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        BindInject<IFetchGenreListUsecase>(
          (i) => FetchGenreListUsecase(genreRepository: i<IGenreRepository>()),
        ),
        BindInject<IGenreRepository>(
          (i) => GenreRepository(httpClient: i<IHttpClient>()),
        ),
        BindInject<IHttpClient>((i) => DioAdapter(Dio())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
