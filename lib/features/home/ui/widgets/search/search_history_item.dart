import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key, required this.term, required this.onTap, required this.onDelete,
  });
  final String term;
  final Function() onTap;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorsManager.lightBlue
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                term,
                style: CustomTextStyles.font12LightGrayRegular(context),
              ),
              IconButton(
                onPressed: onDelete, 
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: ColorsManager.lightGray,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}