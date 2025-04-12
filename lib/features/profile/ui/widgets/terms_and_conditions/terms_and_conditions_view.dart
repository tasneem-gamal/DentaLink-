import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/profile/ui/widgets/terms_and_conditions/terms_and_conditions_view_body.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'Terms & Conditions'),
      body: const TermsAndConditionsViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          '©2025 DentaLink. All Rights Reserved.',
          style: CustomTextStyles.font12BlackMedium(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}