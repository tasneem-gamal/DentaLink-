import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_dot_text.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_text.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsViewBody extends StatelessWidget {
  const TermsAndConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            const CustomTextRich(
              firstTextSpan: 'Welcome to ', 
              mainBlueText: 'DentaLink', 
              text: '! These Terms and Conditions govern your use of our mobile application and any related services provided by us. '
              'By accessing or using the App, you agree to be bound by these Terms. If you do not agree with any part of these Terms, you must not use the App.'
            ),
            verticalSpace(20),
            Text(
              '1. Acceptance of Terms',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomText(
              text: 'By downloading, installing, or using the App, you confirm that you have read, understood, and agree to these Terms.'
              'If you are using the App on behalf of an organization, you represent that you have the authority to bind that organization to these Terms.'
            ),
            verticalSpace(20),
            Text(
              '2. App Usage',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomText(
              text: 'The App is designed to assist dental professionals and patients in managing dental care.'
              'You agree to use the App only for lawful purposes and in accordance with these Terms. Prohibited activities include:'
            ),
            const CustomDotText(
              text: 'Misusing patient data or violating privacy laws.'
            ),
            const CustomDotText(
              text: 'Uploading harmful or malicious content.'
            ),
            const CustomDotText(
              text: 'Reverse-engineering, decompiling, or modifying the App.'
            ),
            verticalSpace(20),
            Text(
              '3. Privacy Policy',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomTextRich(
              firstTextSpan: 'Your use of the App is subject to our ', 
              mainBlueText: 'Privacy Policy', 
              text: ', which explains how we collect, use, and protect your personal information.'
              'By using the App, you consent to the collection and use of your data as outlined in the Privacy Policy.'
            ),
            verticalSpace(20),
            Text(
              '5. Contact Us',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const LabelTextApp(
              label: 'If you have questions or concerns contact us at: ', 
              text: ''
            ),
            const LabelTextApp(
              label: 'Email: ', 
              text: 'DentaLink@g.com'
            ),
            const LabelTextApp(
              label: 'Address: ', 
              text: 'Mansoura'
            ),
            const CustomTextRich(
              firstTextSpan: 'Thank you for using ', 
              mainBlueText: 'DentaLink', 
              text: '! Your trust and privacy are our top priorities.'
            )
          ],
        )
      ),
    );
  }
}