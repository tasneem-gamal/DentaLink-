import 'package:dentalink/core/helpers/app_regex.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          validator: textValidations,
          controller: TextEditingController(),
          hintText: 'Your name',
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: textValidations,
          controller: TextEditingController(),
          hintText: 'Tooth name',
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: textValidations,
          controller: TextEditingController(),
          hintText: 'Exchange with',
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: textValidations,
          controller: TextEditingController(),
          hintText: 'Notes',
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: phoneValidate,
          controller: TextEditingController(),
          hintText: 'Phone number',
        ),
      ],
    );
  }

  textValidations(value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
  }

  phoneValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Phone cannot be empty';
    }
    if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Enter a valid Phone';
    }
  }
}