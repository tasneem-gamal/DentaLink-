import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/home/logic/new_in_tools_cubit/new_in_tools_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/new_in_tools_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewInToolsBlocBuilder extends StatelessWidget {
  const NewInToolsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewInToolsCubit, NewInToolsState>(
      buildWhen: (previous, current) => 
        current is NewInToolsLoading ||
        current is NewInToolsSuccess || 
        current is NewInToolsFailure,
      builder: (context, state){
        if(state is NewInToolsLoading){
          return const CustomLoadingIndicator();
        } else if(state is NewInToolsSuccess){
          return NewInToolsListView(
            toolDate: state.toolDate
          );
        } else if(state is NewInToolsFailure){
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