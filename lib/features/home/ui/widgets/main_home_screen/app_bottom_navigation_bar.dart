import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.mainBlue,
      unselectedItemColor: ColorsManager.lightGray,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bagShopping), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'ChatBot'),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cartShopping), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

