import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SuccessImage extends StatelessWidget {
  const SuccessImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/order_success.png'),
          verticalSpace(10),
          Text(
            'Success',
            style: CustomTextStyles.font16BlackMedium(context),
          ),
        ],
      ),
    );
  }
}