import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorsManager.lightBlue
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Curette',
              style: CustomTextStyles.font12LightGrayRegular(context),
            ),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.cancel_outlined,
                color: ColorsManager.lightGray,
              )
            )
          ],
        ),
      ),
    );
  }
}