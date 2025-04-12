import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleOfTextField(
          title: 'Name',
        ),
        verticalSpace(14),
        CustomTextFormField(
            keyboardType: TextInputType.name,
            controller: context.read<SignCubit>().nameController,
            validator: nameValidate,
            hintText: 'Salem'),
      ],
    );
  }

  nameValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
  }
}