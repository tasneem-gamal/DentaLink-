import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedToolsListView extends StatelessWidget {
  const RelatedToolsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpace(10),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemContainerPatientTool(
          image: 'assets/images/tools.png', 
          itemTitle: 'Curette', 
          firstLabel: 'Price: ', 
          firstLabelText: '200', 
          secondLabel: 'Description: ', 
          secondLabelText: 'for deep cleaning'
        ) 
      ),
    );
  }
}