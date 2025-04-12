import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/publisher/publisher_info_section.dart';
import 'package:flutter/material.dart';

class ToolInfo extends StatelessWidget {
  const ToolInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Curette',
              style: CustomTextStyles.font20BlackMedium(context),
            ),
            Text(
              '250 LE',
              style: CustomTextStyles.font24BlackSemiBold(context).copyWith(
                color: ColorsManager.mainBlue,
                fontWeight: FontWeightHelper.regular,
              ),
            )
          ],
        ),
        verticalSpace(12),
        Text(
          'A sharp, hook-like tool used to detect cavities, plaque, or tartar buildup.',
          style: CustomTextStyles.font14LightGrayRegular(context),
          maxLines: 3,
        ),
        verticalSpace(8),
        const LabelTextApp(
          label: 'Category: ', 
          text: 'Endodontics'
        ),
        const PublisherInfoSection()
      ],
    );
  }
}

