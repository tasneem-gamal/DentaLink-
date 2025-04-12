import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditPatientPostFormFields extends StatelessWidget {
  const EditPatientPostFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          validator: (validator){}, 
          hintText: 'Malek'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (validator){}, 
          hintText: '40'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (validator){}, 
          hintText: 'Cavity'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (validator){}, 
          hintText: 'Male'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (validator){}, 
          hintText: '3452056625'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (validator){}, 
          hintText: 'Mansoura'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (validator){}, 
          hintText: 'Used to adjust braces,.......'
        ),
        verticalSpace(12),
        CustomAppButton(
          onPressed: (){},
          btnText: 'Edit'
        ),
      ],
    );
  }
}