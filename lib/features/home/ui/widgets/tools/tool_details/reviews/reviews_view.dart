import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/reviews_view_body.dart';
import 'package:flutter/material.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'Reviews'),
      body: ReviewsViewBody(),
    );
  }
}

