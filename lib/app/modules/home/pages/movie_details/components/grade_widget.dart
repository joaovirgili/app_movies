import 'package:flutter/material.dart';

import '../../../../../shared/styles.dart';

class GradeWidget extends StatelessWidget {
  const GradeWidget({
    @required this.grade,
    Key key,
  }) : super(key: key);

  final double grade;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: grade?.toString() ?? '',
        style: AppStyles.movieGradeTextStyle,
        children: [
          TextSpan(
            text: '  /  ${10}',
            style: AppStyles.maxGradeTextStyle,
          ),
        ],
      ),
    );
  }
}
