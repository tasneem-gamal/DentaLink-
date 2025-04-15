import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_item.dart';
import 'package:flutter/material.dart';

class SearchItemListView extends StatelessWidget {
  const SearchItemListView({super.key, required this.patientData});

  final List<PatientData> patientData;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => SearchItem(patientData: patientData[index]) ,
      separatorBuilder: (context, index) => verticalSpace(14), 
      itemCount: patientData.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}