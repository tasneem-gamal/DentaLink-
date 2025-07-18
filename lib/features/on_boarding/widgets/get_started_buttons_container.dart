import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';

class GetStartedButtonsContainer extends StatelessWidget {
  const GetStartedButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final containerHeight = screenHeight * 0.38;

    return Container(
      width: double.infinity,
      height: containerHeight,
      decoration: containerDecoration(),
      child: Padding(
        padding: EdgeInsets.only(
          top: containerHeight * 0.25,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            Text(
              'Start your journey with Us.',
              style: CustomTextStyles.font16BlackMedium(context),
            ),
            verticalSpace(containerHeight * 0.05),
            CustomAppButton(
              btnText: 'Get Started',
              onPressed: () {
                context.pushNamed(Routes.signUpView);
              },
              textStyle: CustomTextStyles.font20WhiteSemiBold(context),
              buttonHeight: containerHeight * 0.18,
            ),
            verticalSpace(containerHeight * 0.03),
            CustomAppButton(
              btnText: 'Login',
              onPressed: () {
                context.pushNamed(Routes.loginView);
              },
              textStyle: CustomTextStyles.font20WhiteSemiBold(context),
              buttonHeight: containerHeight * 0.18,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration containerDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, -1),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
    );
  }
}
