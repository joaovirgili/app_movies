import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/colors.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({
    @required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      child: Stack(
        children: [
          Positioned(
            child: Container(height: 150.h, color: AppColors.gray00),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              clipBehavior: Clip.hardEdge,
              child: Image.network(image),
            ),
          ),
        ],
      ),
    );
  }
}
