import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/home/logic/all_tools_cubit/all_tools_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/tools/tools_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllToolsBlocBuilder extends StatelessWidget {
  const AllToolsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllToolsCubit, AllToolsState>(
      buildWhen: (previous, current) => 
        current is AllToolsLoading ||
        current is AllToolsSuccess || 
        current is AllToolsFailure,
      builder: (context, state) {
        if(state is AllToolsLoading){
          return const CustomLoadingIndicator();
        }
        else if(state is AllToolsSuccess){
          return ToolsGridView(
            toolData: state.toolData
          );
        } else if(state is AllToolsFailure){
          return SizedBox(
            child: Text(state.errMessage),
          );
        } else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}