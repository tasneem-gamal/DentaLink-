import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/profile/ui/widgets/all_orders/order_item.dart';
import 'package:flutter/material.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const OrderItem(), 
        separatorBuilder: (context, index) => verticalSpace(12), 
        itemCount: 3
      ),
    );
  }
}