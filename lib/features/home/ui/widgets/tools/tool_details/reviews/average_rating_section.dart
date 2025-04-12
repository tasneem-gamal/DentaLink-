import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AverageRatingsection extends StatelessWidget {
  const AverageRatingsection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Average rating',
          style: CustomTextStyles.font16BlackMedium(context)
        ),
        verticalSpace(14),
        Row(
          children: [
            Text(
              '4.5',
              style: CustomTextStyles.font20WhiteSemiBold(context).copyWith(
                color: Colors.black
              ),
            ),
            horizontalSpace(4),
            RatingBarIndicator(
              rating: 4.5,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 24,
              direction: Axis.horizontal,
            )
          ],
        ),
        verticalSpace(8),
        Text(
          'Average rating on this year',
          style: CustomTextStyles.font14LightGrayRegular(context),
        ),
      ],
    );
  }
}