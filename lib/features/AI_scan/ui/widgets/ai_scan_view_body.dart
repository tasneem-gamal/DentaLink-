import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/intro_continue_container.dart';
import 'package:flutter/material.dart';

class AiScanViewBody extends StatelessWidget {
  const AiScanViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          const IntroContinueContainer(),
          verticalSpace(24),
          Text(
            'How to use',
            style: CustomTextStyles.font16BlackMedium(context),
          ),
          verticalSpace(16),
          const Text(
            '1. Upload an Image – Select and upload a dental X-ray or a photo of teeth.'
          ),
          verticalSpace(12),
          const Text(
            '2. AI Analysis – Our AI will analyze the image to detect potential dental issues.'
          ),
          verticalSpace(12),
          const Text(
            '3. Receive Insights – Get a detailed analysis with possible diagnoses and recommendations.'
          ),
        ],
      ),
    );
  }
}

