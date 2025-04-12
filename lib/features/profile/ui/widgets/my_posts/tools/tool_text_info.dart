import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:flutter/material.dart';

class ToolTextInfo extends StatelessWidget {
  const ToolTextInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const LabelTextApp(label: 'Tool name: ', text: 'Mirror'),
          verticalSpace(8),
          const LabelTextApp(label: 'Price: ', text: '300LE', textStyleText: TextStyle(color: ColorsManager.mainBlue),),
          verticalSpace(8),
          const LabelTextApp(label: 'Category: ', text: 'Endodontics'),
          verticalSpace(8),
          const LabelTextApp(label: 'Description: ', text: 'Used to adjust braces, wires, and other orthodontic appliances.'),
        ],
      ),
    );
  }
}