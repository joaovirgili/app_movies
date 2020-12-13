import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/colors.dart';
import '../../../../../shared/components/components.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      height: paddingTop + 80.h,
      width: double.maxFinite,
      color: AppColors.gray00,
      child: Stack(
        children: [
          Positioned(
            top: 48.h,
            left: 20.w,
            child: AppBackButton(),
          ),
        ],
      ),
    );
  }
}
