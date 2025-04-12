import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/features/profile/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutBlocListner extends StatelessWidget {
  const SignOutBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listenWhen: (previous, current) =>
          current is SignOutSuccess ||
          current is SignOutFailure,
      listener: (context, state) {
        if (state is SignOutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Logout successful')
            )
          );
          context.pop();
          context.pushNamed(Routes.loginView);
        } else if (state is SignOutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errMessage)
            )
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}