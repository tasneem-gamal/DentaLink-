import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patient_details/patient_avatar.dart';
import 'package:flutter/material.dart';

class PatientMainDetails extends StatelessWidget {
  const PatientMainDetails({
    super.key, required this.patientData,
  });
  final PatientData patientData;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const PatientAvatar(),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelTextApp(
                label: 'Publisher: ', 
                text: patientData.createdBy.name, 
              ),
              verticalSpace(4),
              LabelTextApp(
                label: 'patient name: ', 
                text: patientData.name, 
              ),
              verticalSpace(4),
              LabelTextApp(
                label: 'Location: ', 
                text: patientData.location, 
              ),
              verticalSpace(4),
              LabelTextApp(
                label: 'Age: ', 
                text: patientData.age.toString(), 
              ),
              verticalSpace(4),
              LabelTextApp(
                label: 'Gender: ', 
                text: patientData.gander, 
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.favorite_border)
        )
      ],
    );
  }
}