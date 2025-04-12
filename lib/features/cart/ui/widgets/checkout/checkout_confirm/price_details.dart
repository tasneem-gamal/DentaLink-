import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    super.key, required this.title, required this.subTitle,
  });
  
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomTextStyles.font14LightGrayRegular(context),
        ),
        Text(
          subTitle,
          style: CustomTextStyles.font14BlackRegular(context).copyWith(
            fontWeight: FontWeightHelper.medium
          ),
        )
      ],
    );
  }
}