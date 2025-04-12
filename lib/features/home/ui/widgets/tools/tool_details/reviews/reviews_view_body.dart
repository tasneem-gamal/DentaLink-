import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/average_rating_section.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/review_container_list_view.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/user_rating.dart';
import 'package:flutter/material.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  const AverageRatingsection(),
                  verticalSpace(24),
                  const ReviewContainerlistView(),
                ],
              ),
            ),
          ),
          const UserRating(), 
        ],
      ),
    );
  }
}




