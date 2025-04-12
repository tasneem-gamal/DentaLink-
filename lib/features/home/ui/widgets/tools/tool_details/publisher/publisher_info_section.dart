import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/publisher/publisher_info_details_button.dart';
import 'package:flutter/material.dart';

class PublisherInfoSection extends StatelessWidget {
  const PublisherInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Publisher: ',
              style: CustomTextStyles.font12LightGrayRegular(context),
            ),
            TextButton(
              onPressed: (){
                context.pushNamed(Routes.specificShopView);
              }, 
              child: Text(
                'Dentsply Sirona',
                style: CustomTextStyles.font12MainBlueRegular(context),
              )
            ),
          ],
        ),
        const PublisherInfoDetailsButton()
      ],
    );
  }
}

