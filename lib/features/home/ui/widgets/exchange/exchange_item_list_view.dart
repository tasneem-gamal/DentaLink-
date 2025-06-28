import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/exchange_container_item.dart';
import 'package:flutter/material.dart';

class ExchangeItemListView extends StatelessWidget {
  const ExchangeItemListView({
    super.key, required this.exchangeList,
  });

  final List<ExchangeData> exchangeList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => ExchangeContainerItem(
          exchangeData: exchangeList[index],
        ), 
        separatorBuilder: (context, index) => verticalSpace(16), 
        itemCount: exchangeList.length
      ),
    );
  }
}
