import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/tool_post_item_list.dart';
import 'package:flutter/material.dart';

class MyPostsToolsViewBody extends StatelessWidget {
  const MyPostsToolsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          Text(
            'Tools',
            style: CustomTextStyles.font20BlackMedium(context),
          ),
          verticalSpace(16),
          const ToolPostItemList()
        ],
      ),
    );
  }
}







