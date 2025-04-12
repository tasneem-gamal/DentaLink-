import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/tool_post_item.dart';
import 'package:flutter/material.dart';

class ToolPostItemList extends StatelessWidget {
  const ToolPostItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const ToolPostItem(), 
        separatorBuilder: (context, index) => verticalSpace(16), 
        itemCount: 5
      ),
    );
  }
}