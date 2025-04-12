import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_details/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfoDetails extends StatelessWidget {
  const OrderInfoDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const TitleText(title: 'Order date', titleText: '17/4/2025'),
            horizontalSpace(100.w),
            const TitleText(title: 'Payment', titleText: 'Cash on delivery'),
          ],
        ),
        verticalSpace(24),
        const TitleText(
          title: 'Address',
          titleText: '123 Elm Street Springfield, IL 62704 USA',
        ),
        verticalSpace(24),
        const TitleText(
          title: 'Phone number',
          titleText: '+96231520',
        ),
      ],
    );
  }
}
