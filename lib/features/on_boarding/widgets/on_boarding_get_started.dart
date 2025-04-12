import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/on_boarding/widgets/on_boarding_get_started_body.dart';
import 'package:flutter/material.dart';

class OnBoardingGetStarted extends StatelessWidget {
  const OnBoardingGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.lightBlue,
      body: SafeArea(child: OnBoardingGetStartedBody()),
    );
  }
}