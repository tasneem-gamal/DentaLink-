import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FogotPasswordCubit, FogotPasswordState>(
      listenWhen: (previous, current) =>
          current is FogotPasswordLoading ||
          current is FogotPasswordSuccess ||
          current is FogotPasswordFailure,
      listener: (context, state) {
        if (state is FogotPasswordLoading) {
          _showLoadingIndicator(context);
        } else if (state is FogotPasswordSuccess) {
          if (state.forgotPasswordResponseBody.message == "Student not found") {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Email not Found")),
            );
          } else {
            _dismissLoadingIndicator(context);
            context.pop();
            context.pushNamed(Routes.forgotPasswordOtpView);
          }
        } else if (state is FogotPasswordFailure) {
          _dismissLoadingIndicator(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showLoadingIndicator(BuildContext context) {
    if (ModalRoute.of(context)?.isCurrent == true) {
      showDialog(
        context: context,
        builder: (context) => const CustomLoadingIndicator(),
        barrierDismissible: false,
      );
    }
  }

  void _dismissLoadingIndicator(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
