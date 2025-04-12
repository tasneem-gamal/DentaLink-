import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/on_boarding/widgets/get_started_buttons_container.dart';
import 'package:flutter/material.dart';

class OnBoardingGetStartedBody extends StatelessWidget {
  const OnBoardingGetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: Constants.onBoardingPadding,
          child: Text(
            'Connect with your next loyal patient in just a few clicks.',
            style: CustomTextStyles.font24BlackSemiBold(context).copyWith(
              fontFamily: 'Cairo'
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const GetStartedButtonsContainer(),
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/images/get_started.png'),
        ),
      ],
    );
  }
}



