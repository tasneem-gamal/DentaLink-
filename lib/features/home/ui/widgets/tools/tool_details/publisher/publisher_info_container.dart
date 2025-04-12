import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:flutter/material.dart';

class PublisherInfoContainer extends StatelessWidget {
  const PublisherInfoContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: screenWidth * 0.05,
          left: screenWidth * 0.1, 
          bottom: screenHeight * 0.2,
          top: screenHeight * 0.6, 
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorsManager.moreLightGray),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelTextApp(
                      label: 'About Publisher: ', 
                      text: 'One of the largest manufacturers of dental equipment and supplies. They produce everything from hand instruments to imaging systems.'
                    ),
                    verticalSpace(4),
                    const LabelTextApp(
                      label: 'Address: ', 
                      text: '123 Elm Street, Apt 4B, Springfield, IL 62704, USA'
                    ),
                    verticalSpace(4),
                    const LabelTextApp(
                      label: 'Contact info: ', 
                      text: '+999585106845'
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    ]);
  }
}