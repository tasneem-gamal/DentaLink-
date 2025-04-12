import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class IfImageUploadedAddViews extends StatelessWidget {
  const IfImageUploadedAddViews({
    super.key,
    required this.selectedFileName,
    required this.isFileUploaded,
  });

  final String? selectedFileName;
  final bool isFileUploaded;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          selectedFileName!,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.font14BlackRegular(context).copyWith(
            fontWeight: FontWeightHelper.bold
          ),
        ),
        if(selectedFileName != null && isFileUploaded)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.done, color: Colors.green,),
            Text(
              'success',
              style: CustomTextStyles.font14BlackRegular(context).copyWith(
                fontWeight: FontWeightHelper.bold,
                color: Colors.green
              ),
            )
          ],
        )
      ],
    );
  }
}