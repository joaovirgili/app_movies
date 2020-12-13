import 'package:flutter/material.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles.dart';

class MovieTitlesWidget extends StatelessWidget {
  const MovieTitlesWidget({
    @required this.title,
    @required this.originalTitle,
    Key key,
  }) : super(key: key);

  final String title;
  final String originalTitle;

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
        RichText(
          text: TextSpan(
            text: 'Título original: ',
            style: AppStyles.originalTitle,
            children: [
              TextSpan(
                text: originalTitle,
                style: AppStyles.originalTitle
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    );
  }
}
