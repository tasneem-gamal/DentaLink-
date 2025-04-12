import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:flutter/material.dart';

class ContactInfoPatientDetails extends StatelessWidget {
  const ContactInfoPatientDetails({
    super.key, required this.patientData,
  });
  final PatientData patientData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: CustomTextStyles.font16BlackMedium(context),
        ),
        verticalSpace(10),
        Row(
          children: [
            const Icon(Icons.phone),
            horizontalSpace(4),
            Text(
              patientData.phone,
              style: CustomTextStyles.font12BlackRegular(context),
            )
          ],
        )
      ],
    );
  }
}

