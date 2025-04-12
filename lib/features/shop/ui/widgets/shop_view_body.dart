import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/extension.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/core/widgets/custom_text_form_field.dart';
import 'package:dentalink/features/shop/ui/widgets/shop_item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          verticalSpace(20),
          CustomTextFormField(
            readOnly: true,
            onTap: (){
              context.pushNamed(Routes.searchView);
            },
            validator: (validator){}, 
            hintText: 'What are you looking for?',
            prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
          verticalSpace(20),
          const ShopItemsGridView()
        ],
      ),
    );
  }
}

