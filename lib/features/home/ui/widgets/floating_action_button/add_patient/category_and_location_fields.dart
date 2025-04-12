import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/home/logic/add_patient_cubit/add_patient_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/category_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryAndLocationFields extends StatelessWidget {
  const CategoryAndLocationFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleOfTextField(title: 'Category'),
        verticalSpace(12),
        const CategoryDropDownMenu(),
        verticalSpace(16),
        const TitleOfTextField(title: 'Location'),
        verticalSpace(12),
        CustomTextFormField(
          controller: context.read<AddPatientCubit>().locationController,
          validator: locationValidate,
          hintText: 'Mansoura',
        ),
        verticalSpace(16),
      ],
    );
  }

    locationValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Location cannot be empty';
    }
  }
}
