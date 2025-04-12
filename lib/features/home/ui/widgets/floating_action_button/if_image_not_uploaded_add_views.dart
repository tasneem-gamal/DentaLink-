import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class IfImageNotUploadedAddViews extends StatelessWidget {
  const IfImageNotUploadedAddViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Image.asset('assets/images/upload_icon.png'),
          Text(
            'Only .jpg and .png files',
            style: CustomTextStyles.font12LightGrayRegular(context),
          ),
        ],
      ),
    );
  }
}