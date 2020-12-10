import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(constraints, designSize: Size(360, 640));
        return MaterialApp(
          navigatorKey: Modular.navigatorKey,
          title: 'Movies',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
        );
      },
    );
  }
}
