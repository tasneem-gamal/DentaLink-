import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OtherLoginOptionsDivider extends StatelessWidget {
  const OtherLoginOptionsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: ColorsManager.lightGray,
            height: 10,
          ),
        ),
        horizontalSpace(8),
        Text(
          'Or Login with',
          style: CustomTextStyles.font12LightGrayRegular(context),
        ),
        horizontalSpace(8),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: ColorsManager.lightGray,
            height: 10,
          ),
        ),
      ],
    );
  }
}