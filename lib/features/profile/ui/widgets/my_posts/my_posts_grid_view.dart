import 'package:dentalink/features/profile/ui/widgets/my_posts/my_posts_item.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/patients/my_posts_patients_view.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/tools/my_posts_tools_view.dart';
import 'package:flutter/material.dart';

class MyPostsGridView extends StatelessWidget {
  const MyPostsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {"image": "assets/images/tools_icon.png", "text": "Tools", "page" : const MyPostsToolsView()},
      {"image": "assets/images/patients_icon.png", "text": "Patients", "page" : const MyPostsPatientsView()},
    ];
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemCount: 2,
          itemBuilder: (context, index) => MyPostsItem(
            image: posts[index]["image"]!,
            text: posts[index]["text"]!,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => posts[index]["page"] as Widget),
              );
            },
          )),
    );
  }
}
