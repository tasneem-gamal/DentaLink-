import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/profile/ui/widgets/all_orders/order_item_list.dart';
import 'package:flutter/material.dart';

class AllOrdersViewBody extends StatelessWidget {
  const AllOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          Text(
            'All orders (3)',
            style: CustomTextStyles.font20BlackMedium(context),
          ),
          verticalSpace(16),
          const OrderItemListView()
        ],
      ),
    );
  }
}



