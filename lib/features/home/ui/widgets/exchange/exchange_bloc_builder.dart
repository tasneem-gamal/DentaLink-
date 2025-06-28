import 'package:dentalink/core/widgets/custom_loading_indicator.dart';
import 'package:dentalink/features/home/logic/all_exchange_tools/all_exchange_tools_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/exchange_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeBlocBuilder extends StatelessWidget {
  const ExchangeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllExchangeToolsCubit, AllExchangeToolsState>(
      buildWhen: (previous, current) => 
        current is AllExchangeToolsLoading ||
        current is AllExchangeToolsSuccess || 
        current is AllExchangeToolsFailure,
      builder: (context, state) {
        if(state is AllExchangeToolsLoading){
          return const CustomLoadingIndicator();
        }
        else if(state is AllExchangeToolsSuccess){
          return ExchangeItemListView(
            exchangeList: state.allExchanges,
          );
        } else if(state is AllExchangeToolsFailure){
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