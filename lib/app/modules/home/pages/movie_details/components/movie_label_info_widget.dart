import 'package:flutter/material.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/styles.dart';

class MovieLabelInfoWidget extends StatelessWidget {
  const MovieLabelInfoWidget({
    @required this.label,
    @required this.value,
    this.isExpanded = false,
    Key key,
  }) : super(key: key);

  final String label;
  final String value;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.maxFinite : null,
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
