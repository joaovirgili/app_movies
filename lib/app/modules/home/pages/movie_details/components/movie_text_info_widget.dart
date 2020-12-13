import 'package:flutter/material.dart';

import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles.dart';

class MovieTextInfoWidget extends StatelessWidget {
  const MovieTextInfoWidget({
    @required this.title,
    @required this.content,
    Key key,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textFieldHintStyle,
        ),
        SpaceY(8),
        Text(
          content,
          style: AppStyles.movieInfoTextContent,
        ),
      ],
    );
  }
}
