import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_text.dart';
import 'package:dentalink/features/profile/ui/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

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
              firstTextSpan: 'Welcome to our innovative ',
              mainBlueText: 'DentaLink',
              text: ', designed exclusively for dental students! '
                'We understand the challenges you face in finding patients, sourcing tools, and exchanging study materials. '
                'That’s why we’ve created a one-stop platform to make your journey as a dental student smoother, more efficient, and more collaborative.',
            ),
            verticalSpace(20),
            const CustomText(
              text: 'Our app is built with you in mind. Whether you’re searching for patients to practice your skills, '
              'looking for specific dental tools, or wanting to exchange study resources with your peers, we’ve got you covered. '
              'But that’s not all—we’ve also integrated cutting-edge AI analysis to assist you in diagnosing dental conditions, giving you a powerful tool to enhance your learning and clinical skills.',
            ),
            verticalSpace(20),
            Text(
              'Our Mission: ',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomText(
              text: 'To empower dental students with the tools, resources, and technology they need to excel in their studies and clinical practice '
            ),
            verticalSpace(20),
            Text(
              'Our Vision: ',
              style: CustomTextStyles.font14BlackRegular(context),
            ),
            verticalSpace(8),
            const CustomText(
              text: 'To create a connected, innovative, and supportive community for dental students, making learning and practice more accessible and effective.'
            ),
            verticalSpace(20),
            const CustomText(
              text: 'Thank you for joining us on this journey filled with creativity and challenges.'
            ),
            verticalSpace(16),
            Text(
              '— The DentaLink Team',
              style: CustomTextStyles.font14MainBlueRegular(context),
            ),
          ],
        ),
      ),
    );
  }
}




