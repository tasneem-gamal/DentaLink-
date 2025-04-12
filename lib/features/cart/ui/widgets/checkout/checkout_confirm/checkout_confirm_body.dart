import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/cart/ui/widgets/cart_item_list.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_summary_container.dart';
import 'package:flutter/material.dart';

class CheckoutConfirmBody extends StatelessWidget {
  const CheckoutConfirmBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(12),
            const CartItemList(),
            const OrderSummaryContainer()
          ],
        )
      ),
    );
  }
}

