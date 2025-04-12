import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patient_details_view_body.dart';
import 'package:flutter/material.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({super.key, required this.patientData});
  final PatientData patientData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'Patient details'),
      body: PatientDetailsViewBody(
        patientData: patientData,
      ),
    );
  }
}