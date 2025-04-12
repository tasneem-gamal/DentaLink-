import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key, required this.firstTextSpan, required this.mainBlueText, required this.text,
  });
  
  final String firstTextSpan, mainBlueText, text;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstTextSpan,
            style: CustomTextStyles.font14LightGrayRegular(context).copyWith(
              color: ColorsManager.lightGray
            )
          ),
          TextSpan(
            text: mainBlueText,
            style: CustomTextStyles.font14MainBlueRegular(context)
          ),
          TextSpan(
            text: text,
            style: CustomTextStyles.font14LightGrayRegular(context).copyWith(
              color: ColorsManager.lightGray
            )
          ),
        ],
      ),
      textAlign: TextAlign.start,
      softWrap: true,
    );
  }
}