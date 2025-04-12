import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/cart/ui/widgets/checkout/order_details/order_details_view_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'Order details'),
      body: OrderDetailsViewBody(),
    );
  }
}