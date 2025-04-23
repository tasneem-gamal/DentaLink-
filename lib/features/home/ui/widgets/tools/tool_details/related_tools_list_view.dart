import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedToolsListView extends StatelessWidget {
  const RelatedToolsListView({
    super.key, required this.toolData,
  });
  final List<ToolData> toolData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpace(10),
        itemCount: toolData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ItemContainerPatientTool(
          image: 'assets/images/tools.png', 
          itemTitle: toolData[index].toolName, 
          firstLabel: 'Price: ', 
          firstLabelText: toolData[index].price.toString(), 
          secondLabel: 'Description: ', 
          secondLabelText: toolData[index].description
        ) 
      ),
    );
  }
}