import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPostsItem extends StatelessWidget {
  const MyPostsItem({
    super.key, required this.image, required this.text, this.onTap,
  });

  final String image, text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 153.5.w,
        height: 170.h,
        decoration: BoxDecoration(
          color: ColorsManager.lightBlue,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            verticalSpace(8),
            Text(
              text,
              style: CustomTextStyles.font20BlackMedium(context),
            )
          ],
        ),
      ),
    );
  }
}