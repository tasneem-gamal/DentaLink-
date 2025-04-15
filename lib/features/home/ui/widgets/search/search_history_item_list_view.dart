import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/logic/search_cubit/search_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHistoryItemListView extends StatelessWidget {
  const SearchHistoryItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: SharedPreferenceHelper.getStringList('search_history'),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No search history yet'));
        }
        final history = snapshot.data!;
      return Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) => SearchHistoryItem(
            term: history[index],
            onDelete: () async {
                List<String> updated = List.from(history)..removeAt(index);
                await SharedPreferenceHelper.setStringList('search_history', updated);
              },
            onTap: (){
              BlocProvider.of<SearchCubit>(context).search(history[index]);
            },
          ), 
          separatorBuilder: (context, index) => verticalSpace(12), 
          itemCount: history.length
        ),
      );
  });
  }
}