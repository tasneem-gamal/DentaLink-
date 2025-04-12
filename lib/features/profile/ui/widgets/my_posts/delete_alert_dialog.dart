import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Are you sure you want to delete this post?',
        style: CustomTextStyles.font14BlackRegular(context),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(color: ColorsManager.lightGray),
          )
        ),
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Delete',
            style: CustomTextStyles.font14BlackRegular(context).copyWith(
              color: Colors.red
            )
          )
        ),
      ],
    );
  }
}