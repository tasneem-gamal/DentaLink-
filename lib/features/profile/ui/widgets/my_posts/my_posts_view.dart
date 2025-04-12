import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/my_posts_view_body.dart';
import 'package:flutter/material.dart';

class MyPostsView extends StatelessWidget {
  const MyPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'My Posts'),
      body: MyPostsViewBody(),
    );
  }
}