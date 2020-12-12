import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/components/space_y_widget.dart';
import '../../../shared/styles.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    @required this.title,
    @required this.genres,
    @required this.image,
  });

  final List<String> genres;
  final String title;
  final String image;

  String _buildGenreLabel() {
    String genre = genres[0];
    genres
      ..removeAt(0)
      ..forEach((element) {
        genre += ' - $element';
      });
    return genre;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Container(
        height: 550,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(image),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: AppStyles.cardTitleTextStyle,
                  ),
                  SpaceY(12),
                  Text(
                    _buildGenreLabel(),
                    style: AppStyles.cardSubTitleTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCardShimmerLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Container(
        height: 550,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
