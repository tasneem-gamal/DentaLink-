import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/profile/ui/widgets/my_posts/patients/patient_post_item_list.dart';
import 'package:flutter/material.dart';

class MyPostsPatientsViewBody extends StatelessWidget {
  const MyPostsPatientsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          Text(
            'Patients',
            style: CustomTextStyles.font20BlackMedium(context),
          ),
          verticalSpace(16),
          const PatientPostItemList()
        ],
      ),
    );
  }
}



