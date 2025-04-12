import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {
          _showLoadingIndicator(context);
        } else if (state is LoginSuccess) {
          _dismissLoadingIndicator(context);
          context.pop();
          context.pushNamed(Routes.homeView);
        } else if (state is LoginFailure) {
          _dismissLoadingIndicator(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage))
          );
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
