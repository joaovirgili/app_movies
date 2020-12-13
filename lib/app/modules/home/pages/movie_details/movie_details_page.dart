import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../shared/components/components.dart';
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
            GradeWidget(grade: 7.3),
            SpaceY(32),
            MovieTitlesWidget(
              title: 'Capitã Marvel',
              originalTitle: 'Captain Marvel',
            ),
            SpaceY(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MovieLabelInfoWidget(
                  label: 'Ano',
                  value: '2019',
                ),
                SpaceX(12),
                MovieLabelInfoWidget(
                  label: 'Duração',
                  value: '1h 20min',
                ),
              ],
            ),
            SpaceY(12),
            Wrap(
              children: [
                GenreLabelWidget(genre: 'ação'),
                GenreLabelWidget(genre: 'aventura'),
                GenreLabelWidget(genre: 'sci-fi'),
              ],
            ),
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
