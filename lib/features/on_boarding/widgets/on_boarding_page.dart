import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, 
    required this.title, 
    required this.subTitle, 
    required this.image, 
    required this.alignment, 
    required this.wordSubTitle,
  });
  final String title, subTitle, wordSubTitle, image;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: Constants.onBoardingPadding,
          child: Column(
            children: [
              Text(
                title,
                style: CustomTextStyles.font24BlackSemiBold(context),
                textAlign: TextAlign.center,
              ),
              verticalSpace(6),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: subTitle,
                  style: CustomTextStyles.font14LightGrayRegular(context),
                  children: [
                    TextSpan(
                      text: wordSubTitle,
                      style: CustomTextStyles.font14MainBlueRegular(context)
                    )
                  ]
                )
              )
            ],
          ),
        ),
        Align(
          alignment: alignment,
          child: SizedBox(
            child: Image.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
        )
      ],
    );
  }
}