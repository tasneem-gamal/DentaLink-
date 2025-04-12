import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/item_container_patient_tool.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:flutter/material.dart';

class PatientsGridView extends StatelessWidget {
  const PatientsGridView({
    super.key, required this.patientData,
  });
  final List<PatientData> patientData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: patientData.length,
        itemBuilder: (context, index) => ItemContainerPatientTool(
          image: 'assets/images/patient.png', 
          imageWidth: 180,
          itemTitle: patientData[index].createdBy.name, 
          firstLabel: 'Location: ', 
          firstLabelText: patientData[index].location, 
          secondLabel: 'Title: ', 
          secondLabelText: patientData[index].title,
          onTap: (){
            context.pushNamed(
              Routes.patientDetails,
              arguments: patientData[index],
            );
          },
        ),
        )
    );
  }
}