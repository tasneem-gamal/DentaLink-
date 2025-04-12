import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserRating extends StatefulWidget {
  const UserRating({
    super.key,
  });

  @override
  State<UserRating> createState() => _UserRatingState();
}

class _UserRatingState extends State<UserRating> {
  double userRating = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingBar(
              initialRating: userRating,
              minRating: 1,
              maxRating: 5,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 18,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star, color: Colors.amber),
                half: const Icon(Icons.star_half, color: Colors.amber),
                empty: const Icon(Icons.star_border, color: Colors.grey),
              ), 
              onRatingUpdate: (rating){
                setState(() {
                  userRating = rating;
                });
              }
            ),
            Text(
              'Rate Us',
              style: CustomTextStyles.font12LightGrayRegular(context),
            )
          ],
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (validator){}, 
          hintText: 'Type your review',
          suffixIcon: const Icon(Icons.edit),
        )
      ],
    );
  }
}