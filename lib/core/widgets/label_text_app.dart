import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class LabelTextApp extends StatelessWidget {
  const LabelTextApp({
    super.key,
    required this.label,
    required this.text,
    this.textStyleLable,
    this.textStyleText,
    this.overflow,
  });

  final String label;
  final String text;
  final TextStyle? textStyleLable;
  final TextStyle? textStyleText;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    bool isLongText = text.length > 40;

    return isLongText
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textStyleLable ?? CustomTextStyles.font12LightGrayRegular(context),
              ),
              verticalSpace(3),
              Text(
                text,
                style: textStyleText ?? CustomTextStyles.font12BlackRegular(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textStyleLable ?? CustomTextStyles.font12LightGrayRegular(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  text,
                  style: textStyleText ?? CustomTextStyles.font12BlackRegular(context),
                  maxLines: 2,
                  overflow: overflow ?? TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          );
  }
}
