import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/latest_case_item.dart';
import 'package:flutter/material.dart';

class LatestCasesListView extends StatelessWidget {
  const LatestCasesListView({
    super.key, required this.patientData,
  });
  final List<PatientData> patientData;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => LatestCaseItem(
        patientData: patientData[index],
      ), 
      separatorBuilder: (context, index) => verticalSpace(14), 
      itemCount: patientData.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}