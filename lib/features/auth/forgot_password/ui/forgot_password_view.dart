import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: ForgotPasswordViewBody()),
      bottomNavigationBar: Padding(
        padding: Constants.appPadding,
        child: CustomAppButton(
          btnText: 'Continue',
          onPressed: (){
            context.read<FogotPasswordCubit>().emitForgotPasswordState();
          },
        ),
      ),
    );
  }
}