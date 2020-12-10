import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyles {
  static final appBarTitleStyle = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    height: 22,
    color: AppColors.gray06,
  );

  static final textFieldHintStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 17,
    color: AppColors.gray04,
  );

  static final badgeTextStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 15,
    color: AppColors.blue01,
  );

  static final selectedBadgeTextStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 15,
    color: AppColors.white,
  );

  static final cardTitleTextStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 17,
    color: AppColors.white,
  );

  static final cardSubTitleTextStyle = GoogleFonts.montserrat(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 12,
    color: AppColors.white,
  );

  static final movieGradeTextStyle = GoogleFonts.montserrat(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    height: 30,
    color: AppColors.blue01,
  );

  static final maxGradeTextStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 17,
    color: AppColors.gray03,
  );


}
