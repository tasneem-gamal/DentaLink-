import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    super.key,
    required this.text, required this.onTap,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorsManager.otherLightGrayShade),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black
            ),
          )),
    );
  }
}
