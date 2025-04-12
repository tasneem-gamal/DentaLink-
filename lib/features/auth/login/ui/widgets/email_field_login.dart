import 'package:dentalink/core/helpers/app_regex.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailFieldLogin extends StatefulWidget {
  const EmailFieldLogin({super.key});

  @override
  State<EmailFieldLogin> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailFieldLogin> {

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const TitleOfTextField(
              title: 'Email Address',
            ),
            verticalSpace(14),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Salem12@gmail.com',
              validator: emailValidate,
              controller: context.read<LoginCubit>().emailController,
            ),
          ],
        );
  }

  emailValidate(value) {
          if(value == null || value.isEmpty){
            return 'Email cannot be empty';
          }
          if(!AppRegex.isEmailValid(value)){
            return 'Enter a valid email address';
          }
        }
}