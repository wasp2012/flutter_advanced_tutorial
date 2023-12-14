import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/theming/colors.dart';
import 'package:flutter_advanced_tutorial/core/theming/font_weight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    color: ColorsManager.gray,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.darkBlue);
}
