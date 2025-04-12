import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/specific_shop/specific_shop_view_body.dart';
import 'package:flutter/material.dart';

class SpecificShopView extends StatelessWidget {
  const SpecificShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'Dentsply Sirona'),
      body: SpecificShopViewBody(),
    );
  }
}