import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
                MovieInfoWidget(
                  label: 'Ano',
                  value: '2019',
                ),
                SpaceX(12),
                MovieInfoWidget(
                  label: 'Duração',
                  value: '1h 20min',
                ),
              ],
            ),
            SpaceY(12),
            Wrap(
              children: [
                GenreLabelWidget(
                  genre: 'ação',
                ),
                GenreLabelWidget(
                  genre: 'aventura',
                ),
                GenreLabelWidget(
                  genre: 'sci-fi',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
