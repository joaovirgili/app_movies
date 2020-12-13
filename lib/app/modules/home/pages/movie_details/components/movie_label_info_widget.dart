import 'package:flutter/material.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/components/shimmer_effetc_widget.dart';
import '../../../../../shared/styles.dart';

class MovieLabelInfoWidget extends StatelessWidget {
  const MovieLabelInfoWidget({
    @required this.label,
    @required this.value,
    this.isExpanded = false,
    this.isLoading = false,
    Key key,
  }) : super(key: key);

  final String label;
  final String value;
  final bool isExpanded;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      enable: isLoading,
      child: Container(
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
                  text: value == null ? '' : ' $value',
                ),
              ]),
        ),
      ),
    );
  }
}
