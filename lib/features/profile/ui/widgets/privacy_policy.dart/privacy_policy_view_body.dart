import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_dot_text.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_text.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            Text(
              '1. Introduction',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomTextRich(
              firstTextSpan: 'Welcome to ', 
              mainBlueText: 'DentaLink', 
              text: '! Your privacy is important to us. '
                    'This Privacy Policy outlines how we collect, use, disclose, and protect your information when you use our mobile application designed to assist dental students with patient discovery, equipment marketplaces, and educational material exchange.',
            ),
            verticalSpace(20),
            Text(
              '2. Information We Collect',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const LabelTextApp(
              label: 'Personal Information: ', 
              text: 'Name, email address, phone number and age.'
            ),
            verticalSpace(8),
            const LabelTextApp(
              label: 'Patient Matching Information: ', 
              text: 'Any data you voluntarily provide for patient discovery and matching services.'
            ),
            verticalSpace(8),
            const LabelTextApp(
              label: 'Information We Collect Automatically:', 
              text: 'Usage Data: Details about how you interact with the app, including clicks, page views, and time spent on features.'
            ),
            verticalSpace(20),
            Text(
              '3. How We Use Your Information',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomDotText(
              text: 'Facilitate patient discovery and connections between users.',
            ),
            const CustomDotText(
              text: 'Provide access to the dental equipment marketplace.',
            ),
            const CustomDotText(
              text: 'Enable the exchange of educational materials.',
            ),
            const CustomDotText(
              text: 'Improve app functionality and user experience.',
            ),
            const CustomDotText(
              text: 'Communicate with you about updates, promotions, and support.',
            ),
            const CustomDotText(
              text: 'Ensure compliance with applicable laws and academic guidelines.',
            ),
            verticalSpace(20),
            Text(
              '4. Data Security',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomText(
              text: 'We implement reasonable measures to protect your data from unauthorized access, loss, or misuse.' 
              'However, no method of transmission over the internet or electronic storage is 100% secure.'
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
        ),
      ),
    );
  }
}

