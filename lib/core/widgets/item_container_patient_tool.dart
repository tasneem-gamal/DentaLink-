import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemContainerPatientTool extends StatelessWidget {
  const ItemContainerPatientTool({
    super.key, 
    this.width, 
    this.height, 
    required this.image, 
    this.imageWidth,
    required this.itemTitle, 
    required this.firstLabel, 
    required this.firstLabelText, 
    required this.secondLabel, 
    required this.secondLabelText,
    this.onTap
  });
  
  final double? width;
  final double? height;
  final String image;
  final double? imageWidth;
  final String itemTitle;
  final String firstLabel;
  final String firstLabelText;
  final String secondLabel;
  final String secondLabelText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 154,
      height: height ?? 240.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              width: imageWidth,
            ),
            verticalSpace(12),
            Text(
              itemTitle,
              style: CustomTextStyles.font12BlackMedium(context)
            ),
            LabelTextApp(
              label: firstLabel,
              text: firstLabelText,
            ),
            LabelTextApp(
              label: secondLabel, 
              text: secondLabelText, 
              textStyleText: CustomTextStyles.font12MainBlueRegular(context),
            ),
            verticalSpace(8),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: onTap,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorsManager.mainBlue,
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
