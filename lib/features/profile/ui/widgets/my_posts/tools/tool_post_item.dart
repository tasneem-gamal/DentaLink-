import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/change_image.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/edit_and_delete_icons.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/tool_text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolPostItem extends StatelessWidget {
  const ToolPostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            const ChangeImage(
              image: 'assets/images/item.png',
            ),
            horizontalSpace(20),
            const ToolTextInfo(),
            const EditAndDeleteIcons()
          ],
        ),
      ),
    );
  }
}
