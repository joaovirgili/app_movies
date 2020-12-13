import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../shared/components/app_smart_refresher_widget.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/flushbar_erro_widget.dart';
import '../../../../shared/components/shimmer_effetc_widget.dart';
import '../../../../shared/extensions/extensions.dart';
import 'components/components.dart';
import 'movie_details_controller.dart';

class MovieDetailsPage extends StatefulWidget {
  final MoviePreviewEntity moviePreview;

  const MovieDetailsPage({
    @required this.moviePreview,
    Key key,
  }) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState
    extends ModularState<MovieDetailsPage, MovieDetailsController> {
  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    controller.fetchDetails(widget.moviePreview.id);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      autorun((_) {
        if (controller.hasError) {
          flushBarError.show(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return AppSmartRefresher(
          controller: _refreshController,
          onRefresh: () => controller.refreshPage(widget.moviePreview.id),
          isLoading: controller.isRefreshing,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(),
                MoviePosterWidget(
                  image: widget.moviePreview.posterPath,
                  heroTag: widget.moviePreview.id,
                ),
                SpaceY(32),
                Observer(builder: (_) {
                  return ShimmerEffect(
                    enable: controller.isLoading,
                    child: GradeWidget(
                        grade: controller.movieDetails?.voteAverage),
                  );
                }),
                SpaceY(32),
                Observer(builder: (_) {
                  return MovieTitlesWidget(
                    isLoading: controller.isLoading,
                    title: widget.moviePreview.title,
                    originalTitle: controller.movieDetails?.originalTitle,
                  );
                }),
                SpaceY(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (_) {
                      return MovieLabelInfoWidget(
                        isLoading: controller.isLoading,
                        label: 'Ano',
                        value: controller?.movieDetails?.releaseDate?.year
                            ?.toString(),
                      );
                    }),
                    SpaceX(12),
                    Observer(builder: (_) {
                      return MovieLabelInfoWidget(
                        isLoading: controller.isLoading,
                        label: 'Duração',
                        value:
                            controller?.movieDetails?.runtime?.toHourMinute(),
                      );
                    }),
                  ],
                ),
                SpaceY(12),
                Observer(builder: (_) {
                  return ShimmerEffect(
                    enable: controller.isLoading,
                    child: Wrap(
                      children: controller.isLoading
                          ? [
                              GenreLabelWidget(genre: ''),
                              GenreLabelWidget(genre: ''),
                              GenreLabelWidget(genre: ''),
                            ]
                          : controller.movieDetails?.genres
                              ?.map((e) => GenreLabelWidget(genre: e))
                              ?.toList(),
                    ),
                  );
                }),
                SpaceY(50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Observer(builder: (_) {
                    return MovieTextInfoWidget(
                      isLoading: controller.isLoading,
                      title: 'Descrição',
                      content: controller.movieDetails?.overview,
                    );
                  }),
                ),
                SpaceY(40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Observer(builder: (_) {
                    return MovieLabelInfoWidget(
                      isLoading: controller.isLoading,
                      label: 'ORÇAMENTO',
                      value:
                          controller.movieDetails?.budget?.toSimpleCurrency(),
                      isExpanded: true,
                    );
                  }),
                ),
                SpaceY(4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Observer(builder: (_) {
                    return MovieLabelInfoWidget(
                      isLoading: controller.isLoading,
                      label: 'PRODUTORAS',
                      value: controller.movieDetails?.productionCompanies
                          ?.join(', '),
                      isExpanded: true,
                    );
                  }),
                ),
                SpaceY(40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Observer(builder: (_) {
                    return MovieTextInfoWidget(
                      isLoading: controller.isLoading,
                      title: 'Diretor',
                      content: controller.getDirectors().join(', '),
                    );
                  }),
                ),
                SpaceY(32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Observer(builder: (_) {
                    return MovieTextInfoWidget(
                      isLoading: controller.isLoading,
                      title: 'Elenco',
                      content: controller.getCast().join(', '),
                    );
                  }),
                ),
                SpaceY(70),
              ],
            ),
          ),
        );
      }),
    );
  }
}
