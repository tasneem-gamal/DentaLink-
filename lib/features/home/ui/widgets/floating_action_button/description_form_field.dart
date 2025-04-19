import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    super.key, required this.hintText, this.descriptionController,
  });
  final String hintText;
  final TextEditingController? descriptionController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: CustomTextStyles.font14BlackRegular(context),
        ),
        verticalSpace(12),
        CustomTextFormField(
          controller: descriptionController,
          validator: (validator){}, 
          hintText: hintText,
          maxLines: 4,
        ),
      ],
    );
  }
}