import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/add_to_cart_bloc_listner.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/related_tools.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/reviews_section.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/tool_image_container.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/tool_info.dart';
import 'package:flutter/material.dart';

class ToolDetailsViewBody extends StatelessWidget {
  const ToolDetailsViewBody({super.key, required this.toolData});
  final ToolData toolData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(20),
            const ToolImageContainer(),
            verticalSpace(20),
            ToolInfo(
              toolData: toolData,
            ),
            verticalSpace(16),
            const ReviewsSection(),
            verticalSpace(16),
            const RelatedTools(),
            const AddToCartBlocListner()
          ],
        )
      ),
    );
  }
}





