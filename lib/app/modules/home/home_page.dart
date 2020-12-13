import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/entities.dart';
import '../../shared/assets.dart';
import '../../shared/components/space_x_widget.dart';
import '../../shared/components/space_y_widget.dart';
import '../../shared/routes.dart';
import 'components/genre_badge_widget.dart';
import 'components/movie_card_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  AnimationController _hideFabAnimation;

  bool _listReachedPercentage(double percent) =>
      scrollController.offset >=
      scrollController.position.maxScrollExtent * percent;

  @override
  void initState() {
    super.initState();
    _hideFabAnimation = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    );

    scrollController.addListener(() {
      if (_listReachedPercentage(0.03)) {
        if (!_hideFabAnimation.isCompleted) {
          _hideFabAnimation.forward();
        }
      } else {
        _hideFabAnimation.reverse();
      }

      if (_listReachedPercentage(0.85)) {
        if (!controller.isLoadingPage && controller.hasNextPage) {
          controller.fetchMovieListNextPage();
        }
      }
    });
  }

  @override
  void dispose() {
    _hideFabAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ScaleTransition(
        scale: _hideFabAnimation,
        child: FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
            );
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              titleSpacing: 20.w,
              title: Text('Filmes'),
              centerTitle: false,
            ),
            SliverToBoxAdapter(child: const SpaceY(10)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    TextField(
                      onChanged: controller.onChangeFilter,
                      decoration: InputDecoration(
                        hintText: 'Pesquise filmes',
                        prefixIcon: Image.asset(AppAssets.search),
                      ),
                    ),
                    SpaceY(15),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 25.h,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: controller.isLoadingGenre
                              ? _buildGenreLoading()
                              : _buildGenreListView(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: const SpaceY(20)),
            Observer(builder: (_) {
              return !controller.showMovies
                  ? _buildLoadingMovies()
                  : _buildMovieListView(controller.movieList
                      .where(controller.filterByTitle)
                      .toList());
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieListView(List<MoviePreviewEntity> movies) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final currentMovie = movies[index];

          return Hero(
            tag: currentMovie.id,
            child: MovieCardWidget(
              title: currentMovie.title,
              genres: controller.genresToName(currentMovie.genreIds),
              image: currentMovie.posterPath,
              onTap: () => Modular.to.pushNamed(
                AppRoutes.movie,
                arguments: currentMovie,
              ),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  Widget _buildLoadingMovies() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: MovieCardShimmerLoadingWidget(),
          );
        },
        childCount: 2,
      ),
    );
  }

  Widget _buildGenreLoading() => Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => BadgeShimmerLoadingWidget(),
          separatorBuilder: (context, i) => SpaceX(12),
          itemCount: 5,
        ),
      );

  ListView _buildGenreListView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        final currentGenre = controller.genreList[i];

        return Observer(builder: (_) {
          return GenreBadgeWidget(
            label: '${currentGenre.name}',
            onTap: () => controller.onChangeGenre(currentGenre),
            isSelected: controller.isGenreSelected(currentGenre),
          );
        });
      },
      separatorBuilder: (context, i) => SpaceX(12),
      itemCount: controller.genreList.length,
    );
  }
}
