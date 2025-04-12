import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class HeadWelcomeTextAuth extends StatelessWidget {
  const HeadWelcomeTextAuth({
    super.key, required this.title, required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: CustomTextStyles.font20BlackMedium(context),
        ),
        verticalSpace(6),
        Text(
          subTitle,
          style: CustomTextStyles.font14LightGrayRegular(context),
          textAlign: TextAlign.center,
        ),
        verticalSpace(24),
      ],
    );
  }
}