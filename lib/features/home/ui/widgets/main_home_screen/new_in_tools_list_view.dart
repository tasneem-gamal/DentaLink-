import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:flutter/material.dart';

class NewInToolsListView extends StatelessWidget {
  const NewInToolsListView({
    super.key, required this.toolData,
  });
  final List<ToolData> toolData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpace(10),
        scrollDirection: Axis.horizontal,
        itemCount: toolData.length,
        itemBuilder: (context, index) => ItemContainerPatientTool(
          image: 'assets/images/tools_icon.png',
          itemTitle: toolData[index].toolName,
          firstLabel: 'Price: ',
          firstLabelText: toolData[index].price.toString(),
          secondLabel: 'Description:',
          secondLabelText: toolData[index].description,
          onTap: (){
            context.pushNamed(
              Routes.toolDetails,
              arguments: toolData[index]
            );
          },
        )
      ),
    );
  }
}