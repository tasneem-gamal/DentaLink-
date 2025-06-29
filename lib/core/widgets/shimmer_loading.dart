import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h, 
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: ColorsManager.shimmerColorLoading,
            highlightColor: Colors.white,
            child: Container(
              width: double.infinity,
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: ColorsManager.shimmerColorLoading,
              ),
            ),
          ),
          verticalSpace(12),
          Shimmer.fromColors(
            baseColor: ColorsManager.shimmerColorLoading,
            highlightColor: Colors.white,
            child: Container(
              height: 10.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: ColorsManager.shimmerColorLoading,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          verticalSpace(8),
          Shimmer.fromColors(
            baseColor: ColorsManager.shimmerColorLoading,
            highlightColor: Colors.white,
            child: Container(
              height: 10.h,
              width: 160.w,
              decoration: BoxDecoration(
                color: ColorsManager.shimmerColorLoading,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
