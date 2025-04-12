import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Row(
        children: [
          Image.asset('assets/images/tools.png'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Crutte',
                    style: CustomTextStyles.font14BlackRegular(context),
                  ),
                  verticalSpace(8),
                  const LabelTextApp(label: 'Price: ', text: '200LE'),
                  verticalSpace(8),
                  const LabelTextApp(label: 'Description: ', text: 'for deep cleaning.....'),
                ],
              ),
            )
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 30,),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorsManager.mainBlue,
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}