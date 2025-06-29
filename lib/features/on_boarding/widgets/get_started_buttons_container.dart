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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.38,
        decoration: containerDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(top: 79, left: 24, right: 24),
          child: Column(
            children: [
              Text(
                'Start your journey with Us.',
                style: CustomTextStyles.font16BlackMedium(context),
              ),
              verticalSpace(16),
              CustomAppButton(
                btnText: 'Get Started',
                onPressed: (){
                  context.pushNamed(Routes.signUpView);
                },
                textStyle: CustomTextStyles.font20WhiteSemiBold(context),
                buttonHeight: 65,
              ),
              verticalSpace(8),
              CustomAppButton(
                btnText: 'Login',
                onPressed: (){
                  context.pushNamed(Routes.loginView);
                },
                textStyle: CustomTextStyles.font20WhiteSemiBold(context),
                buttonHeight: 65,
              ),
            ],
          ),
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
            color: Colors.black45,
            offset: Offset(4, 4),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      );
  }
}
