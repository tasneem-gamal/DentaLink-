import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/font_weight_helper.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/logic/search_history_cubit/search_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHistoryTitle extends StatelessWidget {
  const SearchHistoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Search History',
          style: CustomTextStyles.font14BlackRegular(context).copyWith(
            fontWeight: FontWeightHelper.medium
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<SearchHistoryCubit>().clearHistory();
          }, 
          icon: const Icon(
            Icons.delete,
            color: ColorsManager.lightGray,
          )
        )
      ],
    );
  }
}