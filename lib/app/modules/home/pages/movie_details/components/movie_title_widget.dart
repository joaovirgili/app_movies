import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles.dart';

class MovieTitlesWidget extends StatelessWidget {
  const MovieTitlesWidget({
    @required this.title,
    @required this.originalTitle,
    this.isLoading = false,
    Key key,
  }) : super(key: key);

  final String title;
  final String originalTitle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title.toUpperCase(),
          style: AppStyles.cardTitleTextStyle.copyWith(
            color: AppColors.gray06,
          ),
        ),
        SpaceY(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Título original: ',
              style: AppStyles.originalTitle,
            ),
            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: isLoading,
                child: Container(width: 70, color: Colors.black, height: 15),
              ),
            if (!isLoading)
              Text(
                originalTitle,
                style: AppStyles.originalTitle
                    .copyWith(fontWeight: FontWeight.w600),
              )
          ],
        )
      ],
    );
  }
}
