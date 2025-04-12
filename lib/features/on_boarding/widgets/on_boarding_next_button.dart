import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/on_boarding/logic/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        OnBoardingController.instance.nextPage(context);
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.03, right: 24.w),
          child: const CircleAvatar(
            backgroundColor: ColorsManager.mainBlue,
            radius: 35,
            child: Icon(Icons.arrow_forward, size: 32, color: Colors.white,),
          ),
        )
      ),
    );
  }
}