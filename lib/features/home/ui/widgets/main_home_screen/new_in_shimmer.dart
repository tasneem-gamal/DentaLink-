import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NewInShimmer extends StatelessWidget {
  const NewInShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
              baseColor: ColorsManager.shimmerColorLoading,
              highlightColor: Colors.white,
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  color: ColorsManager.shimmerColorLoading,
                ),
              ),
            ),
            verticalSpace(20),
            Shimmer.fromColors(
              baseColor: ColorsManager.shimmerColorLoading,
              highlightColor: Colors.white,
              child: Container(
                height: 6.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: ColorsManager.shimmerColorLoading,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            verticalSpace(12),
            Shimmer.fromColors(
              baseColor: ColorsManager.shimmerColorLoading,
              highlightColor: Colors.white,
              child: Container(
                height: 6.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: ColorsManager.shimmerColorLoading,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            verticalSpace(12),
            Shimmer.fromColors(
              baseColor: ColorsManager.shimmerColorLoading,
              highlightColor: Colors.white,
              child: Container(
                height: 6.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: ColorsManager.shimmerColorLoading,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            verticalSpace(12),
            Shimmer.fromColors(
              baseColor: ColorsManager.shimmerColorLoading,
              highlightColor: Colors.white,
              child: Container(
                height: 6.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: ColorsManager.shimmerColorLoading,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
        ],
      ),
    );
  }
}