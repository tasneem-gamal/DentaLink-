import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/specific_shop/specific_shop_grid_view.dart';
import 'package:flutter/material.dart';

class SpecificShopViewBody extends StatelessWidget {
  const SpecificShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          verticalSpace(20),
          const SpecificShopGridView()
        ],
      ),
    );
  }
}

