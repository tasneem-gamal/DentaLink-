import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/edit_button_and_date.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/notes_and_contact.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/tooth_and_info.dart';
import 'package:flutter/material.dart';

class ExchangeContainerItem extends StatelessWidget {
  const ExchangeContainerItem({
    super.key, required this.exchangeData,
  });

  final ExchangeData exchangeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            ToothAndInfo(
              exchangeData: exchangeData,
            ),
            verticalSpace(18),
            NotesAndContact(
              exchangeData: exchangeData,
            ),
            EditButtonAndDate(
              exchangeData: exchangeData,
            )
          ],
        ),
      ),
    );
  }
}