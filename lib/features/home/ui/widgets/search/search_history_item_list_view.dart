import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_item.dart';
import 'package:flutter/material.dart';

class SearchHistoryItemListView extends StatelessWidget {
  const SearchHistoryItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const SearchHistoryItem(), 
        separatorBuilder: (context, index) => verticalSpace(12), 
        itemCount: 3
      ),
    );
  }
}