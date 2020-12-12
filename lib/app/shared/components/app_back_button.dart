import 'package:flutter/material.dart';

import '../assets.dart';
import '../colors.dart';
import '../styles.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: AppColors.white01,
      elevation: 1,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AppAssets.arrowLeft),
              SizedBox(width: 10),
              Text('Voltar', style: AppStyles.backButton),
            ],
          ),
        ),
      ),
    );
  }
}
