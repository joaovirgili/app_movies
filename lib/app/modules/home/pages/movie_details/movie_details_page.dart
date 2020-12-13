import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/components/components.dart';
import 'movie_details_controller.dart';

class MovieDetailsPage extends StatefulWidget {
  final String title;
  const MovieDetailsPage({Key key, this.title = 'MovieDetails'})
      : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState
    extends ModularState<MovieDetailsPage, MovieDetailsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray00,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: AppBackButton(),
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
        ],
      ),
    );
  }
}