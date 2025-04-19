import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewInToolsListView extends StatelessWidget {
  const NewInToolsListView({
    super.key, required this.toolDate,
  });
  final List<ToolData> toolDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpace(10),
        scrollDirection: Axis.horizontal,
        itemCount: toolDate.length,
        itemBuilder: (context, index) => ItemContainerPatientTool(
          image: 'assets/images/tools_icon.png',
          itemTitle: toolDate[index].toolName,
          firstLabel: 'Price: ',
          firstLabelText: toolDate[index].price.toString(),
          secondLabel: 'Description:',
          secondLabelText: toolDate[index].description,
        )
      ),
    );
  }
}