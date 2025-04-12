import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/have_account_text.dart';
import 'package:dentalink/core/widgets/head_welcome_text_auth.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/sign_bloc_listner.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isFileUploaded = false;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset('assets/images/dentalink.png'),
          const HeadWelcomeTextAuth(
              title: 'Create Account',
              subTitle:
                  'Join our community of dental students'),
          const SignUpForm(),
          CustomAppButton(
            btnText: 'Sign Up',
            onPressed: (){
              validateThenDoSign(context);
            },
          ),
          verticalSpace(10),
          HaveAccountText(
            title: 'Already have an account? ', 
            navTitle: 'Login', 
            onTap: (){
              context.pushNamed(Routes.loginView);
            }
          ),
          const SignBlocListner()
        ],
      )),
    );
  }

  void validateThenDoSign(BuildContext context){
    if(context.read<SignCubit>().signFormKey.currentState!.validate()){
      context.read<SignCubit>().emitSignState();
    }
  }
  void updateFileUploadStatus(bool uploaded) {
    setState(() {
      isFileUploaded = uploaded;
    });
  }
}
