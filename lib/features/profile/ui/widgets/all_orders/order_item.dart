import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/profile/ui/widgets/all_orders/order_item_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            const OrderItemInfo(),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assets/images/tools.png'),
                  TextButton(
                    onPressed: (){}, 
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Order details',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorsManager.lightGray
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 18, color: ColorsManager.lightGray,)
                      ],
                    )
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

