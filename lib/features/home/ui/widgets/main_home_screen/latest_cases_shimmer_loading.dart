import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LatestCasesShimmerLoading extends StatelessWidget {
  const LatestCasesShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
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
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: ColorsManager.shimmerColorLoading,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 6.h,
                      width: 180.w,
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
                      width: 160.w,
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
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: ColorsManager.shimmerColorLoading,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              )
            )
        ],
      ),
    );
  }
}