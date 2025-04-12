import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/widgets/title_of_text_field.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicYearDropDownMenu extends StatefulWidget {
  const AcademicYearDropDownMenu({super.key});

  @override
  State<AcademicYearDropDownMenu> createState() =>
      _AcademicYearDropDownMenuState();
}

class _AcademicYearDropDownMenuState extends State<AcademicYearDropDownMenu> {
  List<String> years = ['level four', 'final level'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleOfTextField(title: 'Academic year'),
          verticalSpace(14),
          SizedBox(
            height: 52,
            width: 155,
            child: DropdownButtonFormField<String>(
              decoration: dropDowmDecoration(),
              value: context.read<SignCubit>().selectedYear.text.isEmpty ? null : context.read<SignCubit>().selectedYear.text,
              items: years.map((year) {
                return DropdownMenuItem(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  context.read<SignCubit>().selectedYear.text = newValue!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an academic year';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }

  InputDecoration dropDowmDecoration() {
    return InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Select level',
              hintStyle: const TextStyle(color: ColorsManager.moreLightGray),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: ColorsManager.moreLightGray)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: ColorsManager.moreLightGray)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: ColorsManager.moreLightGray)),
            );
  }
}
