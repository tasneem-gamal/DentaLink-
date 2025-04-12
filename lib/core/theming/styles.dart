import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyles {
  static TextStyle font24BlackSemiBold(BuildContext context) => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      );

  static TextStyle font14LightGrayRegular(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: Theme.of(context).textTheme.bodyMedium?.color ?? ColorsManager.lightGray,
      );

  static TextStyle font14BlackRegular(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      );

  static TextStyle font14WhiteSemiBold(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: Colors.white,
      );

  static TextStyle font14MainBlueRegular(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.mainBlue,
      );

  static TextStyle font12LightGrayRegular(BuildContext context) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.lightGray,
      );

  static TextStyle font12BlackMedium(BuildContext context) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      );

  static TextStyle font12MainBlueRegular(BuildContext context) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: ColorsManager.mainBlue,
      );

  static TextStyle font12MainBlueSemiBold(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font16BlackMedium(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      );

  static TextStyle font20WhiteSemiBold(BuildContext context) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: Colors.white,
      );

  static TextStyle font20BlackMedium(BuildContext context) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.medium,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      );

  static TextStyle font16BlackSemiBold(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
  );

    static TextStyle font12BlackRegular(BuildContext context) =>  TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
  );
}
