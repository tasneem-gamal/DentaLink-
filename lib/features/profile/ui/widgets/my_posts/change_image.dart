import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeImage extends StatelessWidget {
  const ChangeImage({
    super.key, required this.image, this.height, this.width,
  });
  final String image;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height ?? 150.h,
          width: width ?? 70.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorsManager.moreLightGray)
          ),
          child: Image.asset(image),
        ),
        const Positioned(
          bottom: -10,
          right: -10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: ColorsManager.mainBlue,
            child: Icon(Icons.add_a_photo, color: Colors.white,),
          ),
        )
      ],
    );
  }
}