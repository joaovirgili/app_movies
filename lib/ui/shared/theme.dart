import 'package:flutter/material.dart';

import 'styles.dart';

final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    color: Colors.transparent,
    elevation: 0,
    textTheme: TextTheme(
      headline6: AppStyles.appBarTitleStyle,
    ),
  ),
  primarySwatch: Colors.blue,
);
