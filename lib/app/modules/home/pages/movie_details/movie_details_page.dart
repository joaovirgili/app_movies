import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../shared/extensions/int_to_hour_minute.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/shimmer_effetc_widget.dart';
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
  @override
  void initState() {
    super.initState();
    controller.fetchDetails(widget.moviePreview.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            Hero(
              tag: widget.moviePreview.id,
              child: MoviePosterWidget(
                image: widget.moviePreview.posterPath,
              ),
            ),
            SpaceY(32),
            Observer(builder: (_) {
              return ShimmerEffect(
                enable: controller.isLoading,
                child: GradeWidget(grade: controller.movieDetails?.voteAverage),
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
                  return ShimmerEffect(
                    enable: controller.isLoading,
                    child: MovieLabelInfoWidget(
                      label: 'Ano',
                      value: controller?.movieDetails?.releaseDate?.year
                          ?.toString(),
                    ),
                  );
                }),
                SpaceX(12),
                Observer(builder: (_) {
                  return ShimmerEffect(
                    enable: controller.isLoading,
                    child: MovieLabelInfoWidget(
                      label: 'Duração',
                      value: controller?.movieDetails?.runtime?.toHourMinute(),
                    ),
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
              child: MovieTextInfoWidget(
                title: 'Descrição',
                content:
                    'Aventura sobre Carol Danvers, uma agente da CIA que tem contato com uma raça alienígena e ganha poderes sobre-humanos. Entre os seus poderes estão uma força fora do comum e a habilidade de voar.',
              ),
            ),
            SpaceY(40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MovieLabelInfoWidget(
                label: 'ORÇAMENTO',
                value: '\$ 152,000,000',
                isExpanded: true,
              ),
            ),
            SpaceY(4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MovieLabelInfoWidget(
                label: 'PRODUTORAS',
                value: 'Marvel studios',
                isExpanded: true,
              ),
            ),
            SpaceY(40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MovieTextInfoWidget(
                title: 'Diretor',
                content: 'Ryan Fleck, Anna Boden',
              ),
            ),
            SpaceY(32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MovieTextInfoWidget(
                title: 'Elenco',
                content:
                    'Brie Larson, Samuel L. Jackson, Ben Mendelsohn, Djimon Hounsou, Lee Pace',
              ),
            ),
            SpaceY(70),
          ],
        ),
      ),
    );
  }
}
