import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class IfDoesntUploaded extends StatelessWidget {
  const IfDoesntUploaded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.upload_file_rounded),
        horizontalSpace(6),
        Text(
          'Only .jpg and .png files',
          style: CustomTextStyles.font12LightGrayRegular(context),
        )
      ],
    );
  }
}