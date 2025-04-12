import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/features/auth/forgot_password/logic/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBlocListner extends StatelessWidget {
  const ChangePasswordBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listenWhen: (previous, current) =>
            current is ChangePasswordLoading || 
            current is ChangePasswordSuccess || 
            current is ChangePasswordFailure,
        listener: (context, state) {
          if (state is ChangePasswordLoading) {
            _showLoadingIndicator(context);
          } else if (state is ChangePasswordSuccess) {
            _dismissLoadingIndicator(context);
            showSuccessDialog(context);
          } else if (state is ChangePasswordFailure) {
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

  
    dynamic showSuccessDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Congratulations, you have change password successfully!'),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                ),
                onPressed: () {
                  context.pushNamed(Routes.loginView);
                },
                child: const Text('Continue'),
              )
            ],
          );
        }
      );
  }
}