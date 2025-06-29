import 'package:dentalink/features/home/logic/all_tools_cubit/all_tools_cubit.dart';
import 'package:dentalink/core/widgets/shimmer_loading_grid_view.dart';
import 'package:dentalink/features/shop/ui/widgets/shop_item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopBlocBuilder extends StatelessWidget {
  const ShopBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllToolsCubit, AllToolsState>(
      buildWhen: (previous, current) => 
        current is AllToolsLoading ||
        current is AllToolsSuccess || 
        current is AllToolsFailure,
      builder: (context, state) {
        if(state is AllToolsLoading){
          return const ShimmerLoadingGridView();
        }
        else if(state is AllToolsSuccess){
          return ShopItemsGridView(
            toolData: state.toolData,
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