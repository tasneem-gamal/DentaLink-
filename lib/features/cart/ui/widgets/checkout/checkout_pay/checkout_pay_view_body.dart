import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/checkout_pay/payment_methods.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_summary_container.dart';
import 'package:flutter/material.dart';

class CheckoutPayViewBody extends StatelessWidget {
  const CheckoutPayViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            Text(
              'Payment Method',
              style: CustomTextStyles.font20BlackMedium(context),
            ),
            verticalSpace(16),
            const PaymentMethods(),
            const OrderSummaryContainer()
          ],
        )
      ),
    );
  }
}

