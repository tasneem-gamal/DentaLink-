import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';

class PatientAvatar extends StatelessWidget {
  const PatientAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: ColorsManager.lightBlue,
        ),
        Positioned(
          top: 8,
          left: 8,
          right: 8,
          bottom: 8,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/images/patient_avatar.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ],
    );
  }
}