import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/favorites/favorite_item.dart';
import 'package:flutter/material.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const FavoriteItem(), 
        separatorBuilder: (context, index) => verticalSpace(16), 
        itemCount: 3
      ),
    );
  }
}
