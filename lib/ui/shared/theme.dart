import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.gray02,
  accentColor: AppColors.gray02,
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    color: Colors.transparent,
    elevation: 0,
    textTheme: TextTheme(
      headline6: AppStyles.appBarTitleStyle,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.gray01,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    hintStyle: AppStyles.textFieldHintStyle,
  ),
);
