import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditToolPostFormFields extends StatelessWidget {
  const EditToolPostFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          validator: (value){}, 
          hintText: 'Mirror'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (value){}, 
          hintText: '300LE'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (value){}, 
          hintText: 'Endodontics'
        ),
        verticalSpace(12),
        CustomTextFormField(
          validator: (value){}, 
          hintText: 'Used to ...'
        ),
      ],
    );
  }
}