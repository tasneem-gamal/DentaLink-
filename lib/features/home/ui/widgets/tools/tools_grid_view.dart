import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:flutter/material.dart';

class ToolsGridView extends StatelessWidget {
  const ToolsGridView({
    super.key, required this.toolData,
  });
  final List<ToolData> toolData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
      itemCount: toolData.length,
      itemBuilder: (context, index) => ItemContainerPatientTool(
          image: 'assets/images/tools.png',
          imageWidth: 160,
          itemTitle: toolData[index].toolName,
          firstLabel: 'Price: ',
          firstLabelText: toolData[index].price.toString(),
          secondLabel: 'Description: ',
          secondLabelText: toolData[index].description,
          onTap: () {
            context.pushNamed(Routes.toolDetails);
          },
        ),
    ));
  }
}