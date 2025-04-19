import 'package:dentalink/features/home/logic/search_history_cubit/search_history_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHistoryBlocBuilder extends StatelessWidget {
  const SearchHistoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHistoryCubit, SearchHistoryState>(
      builder: (context, state) {
        if (state is SearchHistoryLoaded && state.history.isNotEmpty) {
          return SearchHistoryItemListView(history: state.history);
        } else if (state is SearchHistoryLoaded && state.history.isEmpty) {
          return const Center(child: Text('No search history yet'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
