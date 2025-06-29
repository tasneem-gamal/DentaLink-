import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/data/models/exchange/exchange_data.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/edit_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EditButtonAndDate extends StatelessWidget {
  const EditButtonAndDate({
    super.key, required this.exchangeData,
  });

  final ExchangeData exchangeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          padding: const EdgeInsets.only(top: 20),
          onPressed: (){
            showModalBottomSheet(
                backgroundColor: Colors.white,
                isScrollControlled: true,
                context: context, 
                builder: (context) => const EditBottomSheet()
              );
          }, 
          icon: const Icon(Icons.edit, color: ColorsManager.mainBlue,)
        ),
        Text(
          exchangeData.createdAt,
          style: CustomTextStyles.font12LightGrayRegular(context),
        )
      ],
    );
  }
}