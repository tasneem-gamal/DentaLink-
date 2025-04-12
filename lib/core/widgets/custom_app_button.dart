import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({super.key, 
  required this.btnText, 
  this.onPressed, 
  this.borderRadius, 
  this.backgroundColor, 
  this.txtColor,  this.textStyle, this.buttonWidth, this.buttonHeight});

  final String btnText;
  final void Function()? onPressed;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? txtColor;
  final TextStyle? textStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsManager.mainBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          padding: const EdgeInsets.all(16),
        ),
        child: Text(btnText, style: textStyle ?? CustomTextStyles.font20WhiteSemiBold(context)),
      ),
    );
  }
}
