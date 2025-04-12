import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/home/ui/widgets/favorites/favorites_view_body.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'Favorites'),
      body: FavoritesViewBody(),
    );
  }
}