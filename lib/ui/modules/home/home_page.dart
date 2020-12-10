import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/assets.dart';
import '../../shared/components/space_x_widget.dart';
import '../../shared/components/space_y_widget.dart';
import 'components/genre_badge_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
        ],
      ),
    );
  }

  Container _buildGenreLoading() => Container(); // TODO

  ListView _buildGenreListView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        final currentGenre = controller.genreList[i];

        return Observer(builder: (_) {
          return GenreBadgeWidget(
            label: '${currentGenre.name}',
            onTap: () => controller.setSelectedGenre(currentGenre),
            isSelected: controller.isGenreSelected(currentGenre),
          );
        });
      },
      separatorBuilder: (context, i) => SpaceX(12),
      itemCount: controller.genreList.length,
    );
  }
}
