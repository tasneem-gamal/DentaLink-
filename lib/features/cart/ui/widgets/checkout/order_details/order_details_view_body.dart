import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_divider.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_details/order_info_details.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_details/order_id_section.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_details/success_image.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_summary_container.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            const SuccessImage(),
            verticalSpace(30),
            const OrderIdSection(),
            verticalSpace(10),
            const CustomDivider(),
            verticalSpace(16),
            const OrderInfoDetails(),
            const OrderSummaryContainer()
          ],
        )
      ),
    );
  }
}




