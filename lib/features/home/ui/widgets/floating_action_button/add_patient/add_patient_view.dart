import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_patient/add_patient_view_body.dart';
import 'package:flutter/material.dart';

class AddPatientView extends StatelessWidget {
  const AddPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'Add Patient'),
      body: AddPatientViewBody(),
    );
  }
}