import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TitleOfTextField extends StatelessWidget {
  const TitleOfTextField({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: CustomTextStyles.font14BlackRegular(context),
        ),
        horizontalSpace(3),
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Icon(
            Icons.star,
            size: 9,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}