import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/have_account_text.dart';
import 'package:dentalink/core/widgets/head_welcome_text_auth.dart';
import 'package:dentalink/features/auth/login/ui/widgets/login_bloc_listner.dart';
import 'package:dentalink/features/auth/login/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/dentalink.png'),
            const HeadWelcomeTextAuth(
              title: 'Welcome Back!',
              subTitle: 'Enter your details to get login into your\n account.',
            ),
            verticalSpace(48),
            const LoginForm(),
            verticalSpace(24),
            HaveAccountText(
              title: "Don’t have an account? ", 
              navTitle: "Sign up.", 
              onTap: (){
                context.pop();
              }
            ),
            const LoginBlocListener()
          ],
        ),
      ),
    );
  }
}







