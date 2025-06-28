import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:flutter/material.dart';

class NotesAndContact extends StatelessWidget {
  const NotesAndContact({
    super.key, required this.exchangeData,
  });
  
  final ExchangeData exchangeData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notes: ',
                style: CustomTextStyles.font12LightGrayRegular(context),
              ),
              Text(
                exchangeData.notes,
                softWrap: true,
                overflow: TextOverflow.visible,
              )
            ],
          ),
        ),
        horizontalSpace(50),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact: ',
                style: CustomTextStyles.font12LightGrayRegular(context),
              ),
              Text(
                exchangeData.contact,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        )
      ],
    );
  }
}