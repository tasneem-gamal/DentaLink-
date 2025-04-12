import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/patients/patient_post_item.dart';
import 'package:flutter/material.dart';

class PatientPostItemList extends StatelessWidget {
  const PatientPostItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const PatientPostItem(), 
        separatorBuilder: (context, index) => verticalSpace(16), 
        itemCount: 5
      )
    );
  }
}