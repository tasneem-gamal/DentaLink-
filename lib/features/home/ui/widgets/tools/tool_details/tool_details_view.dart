import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/tool_details_view_body.dart';
import 'package:flutter/material.dart';

class ToolDetailsView extends StatelessWidget {
  const ToolDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'Tool details'),
      body: const ToolDetailsViewBody(),
      bottomNavigationBar: Padding(
        padding: Constants.appPadding,
        child: const CustomAppButton(
          btnText: 'Add to cart'
        ),
      ),
    );
  }
}