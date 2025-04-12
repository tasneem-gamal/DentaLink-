import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorAvatar extends StatelessWidget {
  const DoctorAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.lightBlue,
            radius: 60,
            child: Image.asset(
              'assets/images/doctor_icon.png',
              width: 65,
              height: 65,
              fit: BoxFit.contain,
            ),
          ),
          verticalSpace(10),
          Text(
            'Dr Mahmoud',
            style: CustomTextStyles.font14BlackRegular(context),
          ),
          Text(
            'test@gmail.com',
            style: CustomTextStyles.font12LightGrayRegular(context),
          ),
        ],
      ),
    );
  }
}