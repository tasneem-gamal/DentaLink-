import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyles.font14LightGrayRegular(context).copyWith(
        color: ColorsManager.lightGray
      ),
      textAlign: TextAlign.start,
      softWrap: true,
    );
  }
}