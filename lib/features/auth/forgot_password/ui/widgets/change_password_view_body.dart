import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/change_password_bloc_listner.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/change_password_text_fields.dart';
import 'package:flutter/material.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          Image.asset('assets/images/dentalink.png'),
          Text(
            'Create a new password',
            style: CustomTextStyles.font16BlackMedium(context),
          ),
          verticalSpace(14),
          const ChangePasswordTextFields(),
          const ChangePasswordBlocListner()
        ],
      ),
    ));
  }
}

