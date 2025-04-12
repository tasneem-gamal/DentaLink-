import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/home/ui/widgets/exchange/items_card/edit_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EditButtonAndDate extends StatelessWidget {
  const EditButtonAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
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
          '20/10/2026',
          style: CustomTextStyles.font12LightGrayRegular(context),
        )
      ],
    );
  }
}