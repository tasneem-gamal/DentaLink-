import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalink/features/auth/forgot_password/logic/verify_otp_cubit/verify_otp_cubit.dart';

class VerifyOtpBlocListner extends StatelessWidget {

  const VerifyOtpBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
        listenWhen: (previous, current) =>
            current is VerifyOtpLoading || 
            current is VerifyOtpSuccess || 
            current is VerifyOtpFailure,
        listener: (context, state) {
          if (state is VerifyOtpLoading) {
            _showLoadingIndicator(context);
          } else if (state is VerifyOtpSuccess) {
            _dismissLoadingIndicator(context);
            context.pushNamed(Routes.changePasswordView);
          } else if (state is VerifyOtpFailure) {
            _dismissLoadingIndicator(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage)),
            );
          }
        },
        child: const SizedBox.shrink(),
      );
  }

  void _showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  void _dismissLoadingIndicator(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
