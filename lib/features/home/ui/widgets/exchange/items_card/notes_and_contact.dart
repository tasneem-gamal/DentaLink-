import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class NotesAndContact extends StatelessWidget {
  const NotesAndContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notes: ',
              style: CustomTextStyles.font12LightGrayRegular(context),
            ),
            const Text(
              'The tooth has a cavity.',
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact: ',
              style: CustomTextStyles.font12LightGrayRegular(context),
            ),
            const Text(
              '01020000000',
              overflow: TextOverflow.ellipsis,
            )
          ],
        )
      ],
    );
  }
}