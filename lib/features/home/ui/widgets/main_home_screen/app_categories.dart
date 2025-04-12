import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/category_item.dart';
import 'package:flutter/material.dart';

class AppCategories extends StatelessWidget {
  const AppCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryItem(
          image: Image.asset('assets/images/patients_icon.png'),
          categoryTitle: 'Patients',
          onTap: (){
            context.pushNamed(Routes.patientsView);
          },
        ),
        horizontalSpace(10),
        CategoryItem(
          image: Image.asset('assets/images/exchange_icon.png'),
          categoryTitle: 'Exchange',
          onTap: (){
            context.pushNamed(Routes.exchangeView);
          },
        ),
        horizontalSpace(10),
        CategoryItem(
          image: Image.asset('assets/images/tools_icon.png'),
          categoryTitle: 'Tools',
          onTap: (){
            context.pushNamed(Routes.toolsView);
          },
        ),
      ],
    );
  }
}


