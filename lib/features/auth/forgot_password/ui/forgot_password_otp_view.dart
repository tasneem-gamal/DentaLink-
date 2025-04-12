import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/auth/forgot_password/logic/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/forgot_password_otp_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordOtpView extends StatelessWidget {
  const ForgotPasswordOtpView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: ForgotPasswordOtpViewBody()),
      bottomNavigationBar: Padding(
        padding: Constants.appPadding,
        child: CustomAppButton(
          btnText: 'Verfiy',
          onPressed: (){
            context.read<VerifyOtpCubit>().emitVerifyOtpState();
          },
        ),
      ),
    );
  }
}