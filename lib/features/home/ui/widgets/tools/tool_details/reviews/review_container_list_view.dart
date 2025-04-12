import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/review_container.dart';
import 'package:flutter/material.dart';

class ReviewContainerlistView extends StatelessWidget {
  const ReviewContainerlistView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const ReviewContainer(), 
      separatorBuilder: (context, index) => verticalSpace(14), 
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}