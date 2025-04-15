import 'package:dentalink/core/helpers/custom_error_widget.dart';
import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/home/logic/search_cubit/search_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/search/search_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => 
        current is SearchLoading ||
        current is SearchSuccess || 
        current is SearchFailure,
      builder: (context, state){
        if(state is SearchLoading){
          return const CustomLoadingIndicator();
        } else if(state is SearchSuccess){
          return SearchItemListView(
            patientData: state.searchItems,
          );
        } else if(state is SearchFailure){
          return const CustomErrorWidget(errMessage: 'No results');
        } else {
          return const SizedBox.shrink();
        }
      }
    );
  }
}

