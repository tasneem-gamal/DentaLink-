import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title, required this.titleText});

  final String title, titleText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyles.font12LightGrayRegular(context),
        ),
        verticalSpace(6),
        Text(
          titleText,
          style: CustomTextStyles.font12BlackRegular(context),
        )
      ],
    );
  }
}
