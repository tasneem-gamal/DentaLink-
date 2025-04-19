import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/new_in_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewInShimmerListView extends StatelessWidget {
  const NewInShimmerListView({
    super.key, 
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpace(10),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => const NewInShimmer()
      ),
    );
  }
}