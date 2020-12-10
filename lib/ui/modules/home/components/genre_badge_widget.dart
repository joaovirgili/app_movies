import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class GenreBadgeWidget extends StatelessWidget {
  const GenreBadgeWidget({
    @required this.label,
    this.isSelected = false,
    this.onTap,
  });

  final bool isSelected;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppColors.blue01 : AppColors.white,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.gray01,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? AppStyles.selectedBadgeTextStyle
                : AppStyles.badgeTextStyle,
          ),
        ),
      ),
    );
  }
}
