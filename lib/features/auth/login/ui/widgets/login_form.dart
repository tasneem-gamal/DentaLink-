import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:dentalink/features/auth/login/ui/widgets/email_field_login.dart';
import 'package:dentalink/features/auth/login/ui/widgets/password_field.dart';
import 'package:dentalink/features/auth/login/ui/widgets/remember_and_forgot_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      autovalidateMode: autovalidateMode,
        child: Column(
      children: [
        const EmailFieldLogin(),
        verticalSpace(16),
        const PasswordField(),
        verticalSpace(16),
        const ForgotPasswordButton(),
        verticalSpace(30),
        CustomAppButton(
            btnText: 'Login', 
            onPressed: (){
              validateThenDologin(context);
            },
          )
      ],
    ));
  }

  void validateThenDologin(BuildContext context){
    if(context.read<LoginCubit>().loginFormKey.currentState!.validate()){
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
