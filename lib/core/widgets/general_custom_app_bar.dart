import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class GeneralCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralCustomAppBar({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: (){
            context.pop();
          }, 
          icon: const Icon(
            Icons.arrow_back_ios
          )
        ),
        centerTitle: true,
        title: Text(
          title,
          style: CustomTextStyles.font16BlackMedium(context),
        ),
        actions: [
          Image.asset('assets/images/tooth_icon.png')
        ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}