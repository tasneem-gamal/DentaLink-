import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDotText extends StatelessWidget {
  const CustomDotText({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: CircleAvatar(
            radius: 4,
            backgroundColor: ColorsManager.lightGray,
          ),
        ),
        horizontalSpace(5),
        Expanded(
          child: CustomText(
            text: text
          ),
        )
      ],
    );
  }
}