import 'package:dentalink/features/home/logic/related_tools_cubit/related_tools_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/new_in_shimmer_list_view.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tool_details/related_tools_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedToolsBlocBuilder extends StatelessWidget {
  const RelatedToolsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedToolsCubit, RelatedToolsState>(
      buildWhen: (previous, current) => 
        current is RelatedToolsLoading ||
        current is RelatedToolsSuccess || 
        current is RelatedToolsFailure,
      builder: (context, state){
        if(state is RelatedToolsLoading){
          return const NewInShimmerListView();
        }
        else if(state is RelatedToolsSuccess){
          return RelatedToolsListView();
        } else if(state is RelatedToolsFailure){
          return SizedBox(
            child: Text(state.errMessage),
          );
        } else{
          return const SizedBox.shrink();
        }
      }
    );
  }
}