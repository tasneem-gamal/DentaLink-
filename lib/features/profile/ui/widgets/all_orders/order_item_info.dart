import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:flutter/material.dart';

class OrderItemInfo extends StatelessWidget {
  const OrderItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const LabelTextApp(label: 'Order: ', text: '#3256205'),
          verticalSpace(8),
          const LabelTextApp(label: 'Order Date: ', text: '25/4/2025'),
          verticalSpace(8),
          const LabelTextApp(label: 'Total Amount: ', text: '250LE'),
        ],
      ),
    );
  }
}