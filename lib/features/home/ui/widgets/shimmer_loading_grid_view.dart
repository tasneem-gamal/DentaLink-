import 'package:dentalink/features/home/ui/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingGridView extends StatelessWidget {
  const ShimmerLoadingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: 16,
        itemBuilder: (context, index) => const ShimmerLoading()
        )
    );
  }
}