import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:flutter/material.dart';

class RowFields extends StatelessWidget {
  const RowFields({
    super.key, required this.title1, required this.hintText1, required this.title2, required this.hintText2, this.validator1, this.validator2,
  });
  
  final String title1, hintText1, title2, hintText2;
  final dynamic Function(String?)? validator1;
  final dynamic Function(String?)? validator2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              TitleOfTextField(title: title1),
              verticalSpace(6),
              CustomTextFormField(validator: validator1, hintText: hintText1)
            ],
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            children: [
              TitleOfTextField(title: title2),
              verticalSpace(6),
              CustomTextFormField(validator: validator2, hintText: hintText2)
            ],
          ),
        )
      ],
    );
  }
}