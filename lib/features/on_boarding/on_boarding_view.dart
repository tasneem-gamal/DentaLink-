import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/on_boarding/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.lightBlue,
      body: SafeArea(child: OnBoardingViewBody()),
    );
  }
}