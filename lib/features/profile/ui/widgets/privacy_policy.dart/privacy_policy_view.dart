import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/profile/ui/widgets/privacy_policy.dart/privacy_policy_view_body.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'Privacy Policy'),
      body: const PrivacyPolicyViewBody(),
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