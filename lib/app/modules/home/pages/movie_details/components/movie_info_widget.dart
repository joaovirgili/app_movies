import 'package:flutter/material.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/styles.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({
    @required this.label,
    @required this.value,
    Key key,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.gray01,
        borderRadius: BorderRadius.circular(5),
      ),
      child: RichText(
        text: TextSpan(
            text: '$label: ',
            style: AppStyles.movieInfoLabel,
            children: [
              TextSpan(
                style: AppStyles.movieInfoValue,
                text: ' $value',
              ),
            ]),
      ),
    );
  }
}
