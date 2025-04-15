import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_item_list_view.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_title.dart';
import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SearchHistoryTitle(),
          verticalSpace(12),
          const SearchHistoryItemListView()
        ],
      ),
    );
  }
}