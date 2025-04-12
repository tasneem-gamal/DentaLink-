import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/home/logic/add_patient_cubit/add_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    super.key, required this.hintText,
  });
  final String hintText;

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
          controller: context.read<AddPatientCubit>().descriptionController,
          validator: (validator){}, 
          hintText: hintText,
          maxLines: 4,
        ),
      ],
    );
  }
}