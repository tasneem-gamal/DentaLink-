import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/widgets/custom_app_button.dart';
import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/profile/ui/widgets/edit_profile/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'Edit profile'),
      body: const EditProfileViewBody(),
      bottomNavigationBar: Padding(
        padding: Constants.appPadding,
        child: CustomAppButton(
          btnText: 'Save',
          onPressed: (){},
        ),
      ),
    );
  }
}