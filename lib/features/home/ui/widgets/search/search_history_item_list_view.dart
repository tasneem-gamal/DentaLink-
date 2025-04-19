import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/logic/search_cubit/search_cubit.dart';
import 'package:dentalink/features/home/logic/search_history_cubit/search_history_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHistoryItemListView extends StatelessWidget {
  final List<String> history;

  const SearchHistoryItemListView({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: history.length,
        separatorBuilder: (context, index) => verticalSpace(12),
        itemBuilder: (context, index) => SearchHistoryItem(
          term: history[index],
          onDelete: () {
            context.read<SearchHistoryCubit>().deleteSearchTerm(index);
          },
          onTap: () {
            context.read<SearchCubit>().search(history[index]);
          },
        ),
      ),
    );
  }
}