import 'package:dentalink/core/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenuTopBar extends StatelessWidget {
  const SideMenuTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/tooth_icon.png'),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: (){
              context.pop();
            }, 
            icon: const Icon(FontAwesomeIcons.xmark)
          ),
        )
      ],
    );
  }
}