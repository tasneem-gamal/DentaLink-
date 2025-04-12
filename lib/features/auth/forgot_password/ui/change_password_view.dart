import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/features/auth/forgot_password/logic/change_password_cubit/change_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: ChangePasswordViewBody()),
      bottomNavigationBar: Padding(
        padding: Constants.appPadding,
        child: CustomAppButton(
          btnText: 'Change',
          onPressed: (){
            validateThenChangePassword(context);
          },
        ),
      ),
    );
  }

  void validateThenChangePassword(BuildContext context) {
  final formState = context.read<ChangePasswordCubit>().changePasswordFormKey.currentState;
  if (formState != null && formState.validate()) {
    context.read<ChangePasswordCubit>().emitChangepasswordState();
  }
}
}