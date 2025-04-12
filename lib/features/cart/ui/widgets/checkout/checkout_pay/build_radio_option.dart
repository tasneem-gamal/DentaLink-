  import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class BuildRadioOption extends StatelessWidget {
  final String value;
  final String groupValue;
  final String title;
  final String? description;
  final ValueChanged<String?> onChanged;

  const BuildRadioOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    this.description,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              activeColor: Colors.black,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            horizontalSpace(6),
            Text(
              title,
              style: CustomTextStyles.font14BlackRegular(context),
            ),
          ],
        ),
        if (groupValue == value && description != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 16),
            child: Text(
              description!,
              style: CustomTextStyles.font12LightGrayRegular(context),
            ),
          ),
      ],
    );
  }
}