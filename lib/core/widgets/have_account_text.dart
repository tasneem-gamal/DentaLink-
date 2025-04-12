import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    super.key, required this.title, required this.navTitle, required this.onTap
  });
  final String title, navTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: CustomTextStyles.font12LightGrayRegular(context),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            navTitle,
            style: CustomTextStyles.font12MainBlueSemiBold(context)
          ),
        ),
      ],
    );
  }
}
