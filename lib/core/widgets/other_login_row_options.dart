import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/other_login_option.dart';
import 'package:flutter/material.dart';

class OtherLoginRowOptions extends StatelessWidget {
  const OtherLoginRowOptions({
    super.key, this.width, this.height,
  });
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OtherLoginOption(
          width: width ?? 172,
          height: height ?? 70,
          image: 'assets/images/google.png',
          title: 'Google',
        ), 
        horizontalSpace(16),
        OtherLoginOption(
          width: width ?? 172,
          height: height ?? 70,
          image: 'assets/images/facebook.png',
          title: 'Facebook',
        ),
      ],
    );
  }
}