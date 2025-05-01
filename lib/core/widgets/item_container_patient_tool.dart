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
    this.onTap,
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
      width: width ?? 154.w,
      height: height ?? 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.moreLightGray),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(image, width: imageWidth ?? 100.w),
                  verticalSpace(12),
                  Text(
                    itemTitle,
                    style: CustomTextStyles.font12BlackMedium(context),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorsManager.mainBlue,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
