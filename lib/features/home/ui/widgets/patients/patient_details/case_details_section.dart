import 'package:dentalink/core/helpers/format_date.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:flutter/material.dart';

class CaseDetailsSection extends StatelessWidget {
  const CaseDetailsSection({
    super.key, required this.patientData,
  });

  final PatientData patientData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Case details',
          style: CustomTextStyles.font16BlackMedium(context),
        ),
        verticalSpace(10),
        LabelTextApp(
          label: 'Case type: ', 
          text: patientData.title,
          textStyleText: CustomTextStyles.font12MainBlueRegular(context),
        ),
        verticalSpace(10),
        LabelTextApp(
          label: 'Category: ', 
          text: patientData.category,
        ),
        verticalSpace(10),
        LabelTextApp(
          label: 'Case description: ', 
          text: patientData.description,
        ),
        verticalSpace(10),
        LabelTextApp(
          label: 'Date Added: ', 
          text: formatDate(patientData.createdAt),
        ),
      ],
    );
  }
}