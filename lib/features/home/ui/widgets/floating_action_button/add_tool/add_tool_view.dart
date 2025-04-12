import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_tool/add_tool_view_body.dart';
import 'package:flutter/material.dart';

class AddToolView extends StatelessWidget {
  const AddToolView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'Add Tool'),
      body: AddToolViewBody(),
    );
  }
}