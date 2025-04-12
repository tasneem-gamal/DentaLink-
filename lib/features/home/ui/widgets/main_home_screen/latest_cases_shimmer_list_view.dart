import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/latest_cases_shimmer_loading.dart';
import 'package:flutter/material.dart';

class LatestCasesShimmerListView extends StatelessWidget {
  const LatestCasesShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const  LatestCasesShimmerLoading(), 
      separatorBuilder: (context, index) => verticalSpace(14), 
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}