import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/ui/widgets/favorites/favorite_item_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          Text(
            'Favorites (3)',
            style: CustomTextStyles.font20BlackMedium(context),
          ),
          verticalSpace(16),
          const FavoriteItemListView()
        ],
      ),
    );
  }
}


