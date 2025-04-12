import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/reviews/review_rating_stars_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Roaa',
                      style: CustomTextStyles.font12BlackMedium(context),
                    ),
                    const ReviewRatingStarsList()
                  ],
                ),
                Text(
                  '25/5/2028',
                  style: CustomTextStyles.font12LightGrayRegular(context),
                )
              ],
            ),
            Text(
              'Excellent Quality and Precision – A Must-Have for Dental Professionals!',
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.font12LightGrayRegular(context).copyWith(
                fontWeight: FontWeightHelper.medium
              ),
            )
          ],
        ),
      ),
    );
  }
}

