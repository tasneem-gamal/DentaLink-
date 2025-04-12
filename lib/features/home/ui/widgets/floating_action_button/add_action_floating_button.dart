import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddActionFloatingButton extends StatelessWidget {
  const AddActionFloatingButton({
    super.key, 
    required this.text, 
    required this.image, 
    required this.rightPosition, 
    required this.bottomPosition, 
    this.onTap,
  });
  final String text;
  final String image;
  final double rightPosition;
  final double bottomPosition;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
    right: rightPosition,
    bottom: bottomPosition,
    child: GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 180.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: ColorsManager.moreLightGray)
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: ColorsManager.mainBlue,
                child: Image.asset(
                  image,
                  width: 25,
                  height: 25,
                ),
              ),
              horizontalSpace(8),
              Text(
                text,
                style: CustomTextStyles.font14LightGrayRegular(context).copyWith(
                  color: Colors.black
                ),
              )
            ],
          )
        ),
      ),
    ),
            );
  }
}