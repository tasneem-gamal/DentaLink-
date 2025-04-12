import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/academic_year_drop_down_menu.dart';
import 'package:dentalink/features/auth/sign_up/ui/widgets/student_id_field.dart';
import 'package:flutter/material.dart';

class AcademicAndStudentIdSign extends StatelessWidget {
  const AcademicAndStudentIdSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AcademicYearDropDownMenu(),
        horizontalSpace(12),
        const StudentIdField()
      ],
    );
  }
}

