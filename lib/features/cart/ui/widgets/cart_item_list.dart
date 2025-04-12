import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/features/cart/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatefulWidget {
  const CartItemList({
    super.key,
  });

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  List<int> items = List.generate(3, (index) => index);

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CartItem(
        onDelete: () => _removeItem(index),
      ), 
      separatorBuilder: (context, index) => verticalSpace(12), 
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
