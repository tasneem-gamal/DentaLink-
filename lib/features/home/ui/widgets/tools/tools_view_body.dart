import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tools_grid_view.dart';
import 'package:flutter/material.dart';

class ToolsViewBody extends StatelessWidget {
  const ToolsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          verticalSpace(20),
          const ToolsGridView()
        ],
      ),
    );
  }
}


