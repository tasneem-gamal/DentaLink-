import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/my_posts_grid_view.dart';
import 'package:flutter/material.dart';

class MyPostsViewBody extends StatelessWidget {
  const MyPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Constants.appPadding,
        child: Column(
          children: [
            verticalSpace(20),
            const MyPostsGridView()
          ],
        ));
  }
}


