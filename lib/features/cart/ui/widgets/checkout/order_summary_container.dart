import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_divider.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/checkout_confirm/price_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryContainer extends StatelessWidget {
  const OrderSummaryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(24),
        Text(
          'Order summary',
          style: CustomTextStyles.font20BlackMedium(context),
        ),
        verticalSpace(16),
        Container(
          height: 170.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorsManager.moreLightGray)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const PriceDetails(
                  title: 'Product total',
                  subTitle: '2400',
                ),
                verticalSpace(10),
                const PriceDetails(
                  title: 'Delivery fee',
                  subTitle: '70',
                ),
                verticalSpace(10),
                const PriceDetails(
                  title: 'Discount',
                  subTitle: '0',
                ),
                verticalSpace(10),
                const CustomDivider(),
                verticalSpace(10),
                const PriceDetails(
                  title: 'Total',
                  subTitle: '3000',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

