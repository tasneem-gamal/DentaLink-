import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/profile/ui/widgets/all_orders/all_orders_view_body.dart';
import 'package:flutter/material.dart';

class AllOrdersView extends StatelessWidget {
  const AllOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'All Orders'),
      body: AllOrdersViewBody(),
    );
  }
}