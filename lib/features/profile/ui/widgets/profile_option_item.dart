import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class ProfileOptionItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function() onTap;

  const ProfileOptionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(
            title,
            style: CustomTextStyles.font16BlackMedium(context),
          ),
          trailing: GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        verticalSpace(8),
        const CustomDivider(),
        verticalSpace(8),
      ],
    );
  }
}