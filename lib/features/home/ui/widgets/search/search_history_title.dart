import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SearchHistoryTitle extends StatelessWidget {
  const SearchHistoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Search History',
          style: CustomTextStyles.font14BlackRegular(context).copyWith(
            fontWeight: FontWeightHelper.medium
          ),
        ),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(
            Icons.delete,
            color: ColorsManager.lightGray,
          )
        )
      ],
    );
  }
}