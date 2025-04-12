import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/cart/ui/widgets/cart_item_list.dart';
import 'package:dentalink/features/cart/ui/widgets/recommendation_tools_list.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
              'Cart (2)',
              style: CustomTextStyles.font20BlackMedium(context),
            ),
            verticalSpace(16),
            const CartItemList(),
            verticalSpace(24),
            Text(
              'You might like',
              style: CustomTextStyles.font20BlackMedium(context),
            ),
            verticalSpace(16),
            const RecommendationToolsList()
          ],
        )
      ),
    );
  }
}



