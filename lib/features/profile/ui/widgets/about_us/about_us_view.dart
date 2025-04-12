import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/profile/ui/widgets/about_us/about_us_view_body.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralCustomAppBar(title: 'About Us'),
      body: const AboutUsViewBody(),
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