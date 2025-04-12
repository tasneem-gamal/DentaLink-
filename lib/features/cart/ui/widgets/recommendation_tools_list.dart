import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class RecommendationToolsList extends StatelessWidget {
  const RecommendationToolsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        itemBuilder: (context, index) => ItemContainerPatientTool(
          image: 'assets/images/tools.png', 
          imageWidth: 180,
          itemTitle: 'Cruette', 
          firstLabel: 'Price: ', 
          firstLabelText: '200', 
          secondLabel: 'Description: ', 
          secondLabelText: 'for deep cleaning',
          onTap: (){
            context.pushNamed(Routes.toolDetails);
          },
        ), 
        separatorBuilder: (context, index) => horizontalSpace(12), 
        itemCount: 4,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
