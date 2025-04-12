import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OtherLoginOption extends StatelessWidget {
  const OtherLoginOption({
    super.key, required this.width, required this.height, required this.image, required this.title,
  });
  final double width, height;
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorsManager.otherLightGrayShade,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          horizontalSpace(6),
          Text(title, style: CustomTextStyles.font16BlackSemiBold(context),)
        ],
      ),
    );
  }
}