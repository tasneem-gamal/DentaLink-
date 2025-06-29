import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingListView extends StatelessWidget {
  const ShimmerLoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const ShimmerLoading(), 
        separatorBuilder: (context, index) => verticalSpace(16), 
        itemCount: 6
      ),
    );
  }
}