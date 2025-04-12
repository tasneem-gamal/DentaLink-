import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PatientsShimmerLoading extends StatelessWidget {
  const PatientsShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230.h,
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: ColorsManager.shimmerColorLoading,
              highlightColor: Colors.white,
              child: Container(
                width: 180.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
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
        ));
  }
}
