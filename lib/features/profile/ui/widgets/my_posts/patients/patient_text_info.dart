import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:flutter/material.dart';

class PatientTextInfo extends StatelessWidget {
  const PatientTextInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const LabelTextApp(label: 'Patient name: ', text: 'Malek'),
          verticalSpace(8),
          const LabelTextApp(label: 'Age: ', text: '40'),
          verticalSpace(8),
          const LabelTextApp(label: 'Title: ', text: 'Cavity'),
          verticalSpace(8),
          const LabelTextApp(label: 'Location: ', text: 'Mansoura'),
          verticalSpace(8),
          const LabelTextApp(label: 'Gender: ', text: 'Male'),
          verticalSpace(8),
          const LabelTextApp(label: 'Phone number: ', text: '3456205'),
          verticalSpace(8),
          const LabelTextApp(label: 'Category: ', text: 'Endodontics'),
        ],
      ),
    );
  }
}