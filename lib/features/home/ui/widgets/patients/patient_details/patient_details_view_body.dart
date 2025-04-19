import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/custom_divider.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patient_details/case_details_section.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patient_details/contact_info_patient_details.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patient_details/patient_attachments_list.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patient_details/patient_main_details.dart';
import 'package:flutter/material.dart';

class PatientDetailsViewBody extends StatelessWidget {
  const PatientDetailsViewBody({super.key, required this.patientData});

  final PatientData patientData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          verticalSpace(20),
          PatientMainDetails(
            patientData: patientData,
          ),
          verticalSpace(26),
          const CustomDivider(),
          verticalSpace(12),
          CaseDetailsSection(
            patientData: patientData,
          ),
          verticalSpace(26),
          const CustomDivider(),
          verticalSpace(12),
          PatientAttachmentsList(
            patientData: patientData,
          ),
          verticalSpace(18),
          const CustomDivider(),
          verticalSpace(12),
          ContactInfoPatientDetails(
            patientData: patientData,
          )
        ],
      ),
    );
  }
}








