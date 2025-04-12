import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/exchange_container_item.dart';
import 'package:flutter/material.dart';

class ExchangeItemListView extends StatelessWidget {
  const ExchangeItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const ExchangeContainerItem(), 
        separatorBuilder: (context, index) => verticalSpace(16), 
        itemCount: 4
      ),
    );
  }
}
