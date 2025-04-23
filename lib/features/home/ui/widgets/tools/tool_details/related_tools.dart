import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/related_tools_bloc_builder.dart';
import 'package:flutter/material.dart';

class RelatedTools extends StatelessWidget {
  const RelatedTools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Related',
          style: CustomTextStyles.font16BlackMedium(context),
        ),
        verticalSpace(12),
        const RelatedToolsBlocBuilder()
      ],
    );
  }
}


