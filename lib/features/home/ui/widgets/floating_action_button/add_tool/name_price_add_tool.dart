import 'package:dentalink/core/helpers/app_regex.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:flutter/material.dart';

class NamePriceAddTool extends StatelessWidget {
  const NamePriceAddTool({
    super.key, required this.nameController, required this.priceController,
  });

  final TextEditingController nameController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleOfTextField(title: 'Tool Name'),
        verticalSpace(12),
        CustomTextFormField(
          validator: nameValidate, 
          controller: nameController,
          hintText: 'ex. Mouth Mirror'
        ),
        verticalSpace(16),
        const TitleOfTextField(title: 'Price'),
        verticalSpace(12),
        CustomTextFormField(
          validator: priceValidate, 
          controller: priceController,
          hintText: 'ex. 200LE'
        ),
      ],
    );
  }

    nameValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
  }

  priceValidate(value) {
  if (value == null || value.isEmpty) {
    return 'Price cannot be empty';
  }
  if (!AppRegex.isPriceValid(value)) {
    return 'Enter a valid Price';
  }
}
}