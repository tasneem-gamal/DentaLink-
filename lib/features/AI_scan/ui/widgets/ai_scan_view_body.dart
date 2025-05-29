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
            '1. Ask dental questions in plain text – from symptoms to treatment suggestions – and get instant answers.'
          ),
          verticalSpace(12),
          const Text(
            '2. Upload dental images (e.g., X-rays), and the bot will analyze them to detect potential issues or provide diagnosis assistance.'
          ),
          verticalSpace(12),
          const Text(
            '3. Get real-time support for your dental cases, studies, or patient scenarios.'
          ),
        ],
      ),
    );
  }
}

