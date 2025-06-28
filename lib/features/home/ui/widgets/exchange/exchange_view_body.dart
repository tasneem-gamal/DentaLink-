import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/exchange_bloc_builder.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/search_field_and_add_button.dart';
import 'package:flutter/material.dart';

class ExchangeViewBody extends StatelessWidget {
  const ExchangeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        children: [
          verticalSpace(20),
          const SearchFieldAndAddButton(),
          verticalSpace(20),
          const ExchangeBlocBuilder()
        ],
      ),
    );
  }
}









