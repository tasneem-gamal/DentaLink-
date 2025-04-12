import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OrderIdSection extends StatelessWidget {
  const OrderIdSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order ID',
          style: CustomTextStyles.font16BlackMedium(context),
        ),
        verticalSpace(10),
        Text(
          '#362564592',
          style: CustomTextStyles.font16BlackMedium(context),
        ),
      ],
    );
  }
}