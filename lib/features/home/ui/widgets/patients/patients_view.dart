import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patients_view_body.dart';
import 'package:flutter/material.dart';

class PatientsView extends StatelessWidget {
  const PatientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar: GeneralCustomAppBar(title: 'Patients'),
      body: PatientsViewBody(),
    );
  }
}