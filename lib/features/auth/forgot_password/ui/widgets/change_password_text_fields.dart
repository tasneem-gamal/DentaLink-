import 'package:dentalink/core/helpers/app_regex.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/auth/forgot_password/logic/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordTextFields extends StatefulWidget {
  const ChangePasswordTextFields({
    super.key,
  });

  @override
  State<ChangePasswordTextFields> createState() => _ChangePasswordTextFieldsState();
}

class _ChangePasswordTextFieldsState extends State<ChangePasswordTextFields> {
  final TextEditingController passwordConfirmController = TextEditingController();
  bool isObsecureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  void dispose() {
    passwordConfirmController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ChangePasswordCubit>().changePasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          Text(
            'New Password',
            style: CustomTextStyles.font14BlackRegular(context),
          ),
          verticalSpace(8),
          CustomTextFormField(
            controller: context.read<ChangePasswordCubit>().passwordController,
            validator: passwordValidate, 
            hintText: '*****************',
            isObsecureText: isObsecureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObsecureText = !isObsecureText;
                  });
                },
                child: Icon(isObsecureText ? Icons.visibility_off : Icons.visibility,)
              ),
          ),
          verticalSpace(12),
          Text(
            'Confirm New Password',
            style: CustomTextStyles.font14BlackRegular(context),
          ),
          verticalSpace(8),
          CustomTextFormField(
            controller: passwordConfirmController,
            validator: confirmPasswordValidate, 
            hintText: '*****************',
            isObsecureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                  });
                },
                child: Icon(isPasswordConfirmationObscureText ? Icons.visibility_off : Icons.visibility,)
              ),
          ),
        ],
      ),
    );
  }

    confirmPasswordValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value != context.read<ChangePasswordCubit>().passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

    String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (!AppRegex.hasMinLength(value)) {
      return "Password must be at least 8 characters.";
    }
    if (!AppRegex.hasLowerCase(value)) {
      return "Password must contain at least one lowercase letter.";
    }
    if (!AppRegex.hasSpecialCharacter(value)) {
      return "Password must contain at least one special character.";
    }
    return null;
  }
}

