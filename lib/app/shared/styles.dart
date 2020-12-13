import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyles {
  static final appBarTitleStyle = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray06,
  );

  static final textFieldHintStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.gray04,
  );

  static final badgeTextStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.blue01,
  );

  static final selectedBadgeTextStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static final cardTitleTextStyle = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final cardSubTitleTextStyle = GoogleFonts.montserrat(
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static final movieGradeTextStyle = GoogleFonts.montserrat(
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blue01,
  );

  static final maxGradeTextStyle = GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray03,
  );

  static final backButton = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.gray05,
  );

  static final originalTitle = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.gray04,
  );

  static final movieOriginalTitle =
      originalTitle.copyWith(fontWeight: FontWeight.w500);

  static final movieInfoLabel = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray03,
  );

  static final movieInfoValue = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray06,
  );

  static final genreLabel = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray04,
  );
}
