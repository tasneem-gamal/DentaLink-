import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/home/ui/widgets/floating_action_button/add_action_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloatingActionButton extends StatefulWidget {
  const HomeFloatingActionButton({super.key});

  @override
  State<HomeFloatingActionButton> createState() => _HomeFloatingActionButtonState();
}

class _HomeFloatingActionButtonState extends State<HomeFloatingActionButton> {
  bool isPressed = false;
  OverlayEntry? overlayEntry;

  @override
  void dispose() {
    overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      height: 70.h,
      child: FloatingActionButton(
        onPressed: toggleContainer,
        shape: const CircleBorder(),
        backgroundColor: ColorsManager.mainBlue,
        child: Icon(
          isPressed ? Icons.close : Icons.add,
          size: 36,
          color: Colors.white,
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          AddActionFloatingButton(
            onTap: (){
              toggleContainer(closeOnly: true);
              context.pushNamed(Routes.addTool);
            },
            text: 'Add Tool',
            image: 'assets/images/tools_icon.png',
            rightPosition: 20.w,
            bottomPosition: 210.h,
          ),
          AddActionFloatingButton(
            onTap: (){
              toggleContainer(closeOnly: true);
              context.pushNamed(Routes.addPatient);
            },
            text: 'Add Patient',
            image: 'assets/images/doctor_icon.png',
            rightPosition: 20.w,
            bottomPosition: 150.h,
          ),
      ]),
    );
  }

  void toggleContainer({bool closeOnly = false}) {
  if (isPressed || closeOnly) {
    removeOverlay();
  } else {
    overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(overlayEntry!);
    setState(() {
      isPressed = true;
    });
  }
}

void removeOverlay() {
  overlayEntry?.remove();
  overlayEntry = null;
  setState(() {
    isPressed = false;
  });
}
}


