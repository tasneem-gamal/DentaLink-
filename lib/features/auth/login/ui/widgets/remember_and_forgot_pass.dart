import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatefulWidget {
  const ForgotPasswordButton({super.key});

  @override
  State<ForgotPasswordButton> createState() => _ForgotPasswordButton();
}

class _ForgotPasswordButton extends State<ForgotPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            context.pushNamed(Routes.forgotPasswordView);
          },
          child: Text(
            'Forgot Password?',
            style: CustomTextStyles.font12MainBlueSemiBold(context),
          )),
    );
  }
}
