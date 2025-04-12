import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/features/home/ui/widgets/side_menu/side_menu_dark_mode_item.dart';
import 'package:dentalink/features/home/ui/widgets/side_menu/side_menu_item.dart';
import 'package:dentalink/features/home/ui/widgets/side_menu/side_menu_top_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';

class AppSideMenu extends StatelessWidget {
  const AppSideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        backgroundColor: Theme.of(context).canvasColor,
        child: ListView(
          children: [
            const SideMenuTopBar(),
            verticalSpace(30),
            SideMenuItem(
              text: 'My posts',
              onTap: (){
                context.pushNamed(Routes.myPostsView);
              },
            ),
            verticalSpace(10),
            SideMenuItem(
              text: 'Favourites',
              onTap: (){
                context.pushNamed(Routes.favoritesView);
              },
            ),
            verticalSpace(10),
            const SideMenuDarkModeItem(
              text: 'Dark Mode',
            ),
            verticalSpace(10),
            SideMenuItem(
              text: 'About us',
              onTap: (){
                context.pushNamed(Routes.aboutUsView);
              },
            ),
            verticalSpace(10),
            SideMenuItem(
              text: 'Terms & Conditions',
              onTap: (){
                context.pushNamed(Routes.termsAndConditionsView);
              },
            ),
            verticalSpace(10),
            SideMenuItem(
              text: 'Privacy Policy',
              onTap: (){
                context.pushNamed(Routes.privacyPolicyView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
