import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/cart/ui/widgets/delete_and_add_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key, required this.onDelete,
  });

  final Function() onDelete;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    } else {
      widget.onDelete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Image.asset('assets/images/item.png'),
            horizontalSpace(6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dental Drill',
                    style: CustomTextStyles.font12BlackMedium(context),
                  ),
                  verticalSpace(8),
                  Text(
                    'Used to remove decay and shape teeth for fillings or crowns',
                    style: CustomTextStyles.font12LightGrayRegular(context),
                  ),
                  verticalSpace(8),
                  DeleteAndAddButtons(
                    quantity: quantity,
                    onDecrease: _decreaseQuantity,
                    onIncrease: _increaseQuantity,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

