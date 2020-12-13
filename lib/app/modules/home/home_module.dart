import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../data/http/http_client.dart';
import '../../../data/repositories/repositories.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../infra/dio/dio.dart';
import '../../shared/routes.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'pages/movie_details/movie_details.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MovieDetailsController,
        $HomeController,
        BindInject<IFetchGenreListUsecase>(
          (i) => FetchGenreListUsecase(genreRepository: i<IGenreRepository>()),
        ),
        BindInject<IFetchMovieListByGenre>(
          (i) => FetchMovieListByGenre(movieRepository: i<IMovieRepository>()),
        ),
        BindInject<IFetchMovieDetails>(
          (i) => FetchMovieDetails(movieRepository: i<IMovieRepository>()),
        ),
        BindInject<IGenreRepository>(
          (i) => GenreRepository(httpClient: i<IHttpClient>()),
        ),
        BindInject<IMovieRepository>(
          (i) => MovieRepository(httpClient: i<IHttpClient>()),
        ),
        BindInject<IHttpClient>((i) => DioAdapter(Dio())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter(
          AppRoutes.movie,
          child: (_, args) => MovieDetailsPage(moviePreview: args.data),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
