import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DeleteAndAddButtons extends StatelessWidget {
  const DeleteAndAddButtons({
    super.key, required this.quantity, this.onIncrease, this.onDecrease,
  });

  final int quantity;
  final Function()? onIncrease;
  final Function()? onDecrease;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1200',
          style: CustomTextStyles.font16BlackMedium(context).copyWith(
            color: ColorsManager.mainBlue
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: onDecrease,
              child: Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: ColorsManager.shimmerColorLoading
                ),
                child: Icon(
                  quantity > 1 ? Icons.remove : Icons.delete,
                  color: quantity > 1 ? Colors.black : Colors.red,
                ),
              ),
            ),
            horizontalSpace(6),
            Text(
              '$quantity',
              style: CustomTextStyles.font16BlackMedium(context),
            ),
            horizontalSpace(6),
            GestureDetector(
              onTap: onIncrease,
              child: Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: ColorsManager.shimmerColorLoading
                ),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        )
      ],
    );
  }
}