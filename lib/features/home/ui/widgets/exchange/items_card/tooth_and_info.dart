import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/label_text_app.dart';
import 'package:dentalink/features/home/data/models/exchange/exchange_data.dart';
import 'package:flutter/material.dart';

class ToothAndInfo extends StatelessWidget {
  const ToothAndInfo({
    super.key, required this.exchangeData,
  });
  
  final ExchangeData exchangeData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/exchange_tooth.png'),
        horizontalSpace(16),
        Expanded(
          child: Column(
            children: [
              LabelTextApp(
                label: 'Publisher: ', 
                text: exchangeData.createdBy?.name ?? exchangeData.publisher,
              ),
              LabelTextApp(
                label: 'Name: ', 
                text: exchangeData.name
              ),
              LabelTextApp(
                label: 'Exchange with: ', 
                text: exchangeData.exchangeWith
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.favorite_border, size: 32,)
        )
      ],
    );
  }
}
