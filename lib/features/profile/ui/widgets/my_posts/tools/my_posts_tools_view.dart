import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/my_posts_tools_view_body.dart';
import 'package:flutter/material.dart';

class MyPostsToolsView extends StatelessWidget {
  const MyPostsToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'My Posts'),
      body: MyPostsToolsViewBody(),
    );
  }
}