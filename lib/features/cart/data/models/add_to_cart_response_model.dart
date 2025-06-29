import 'package:dentalink/features/home/data/models/tool_data.dart';

class AddToCartResponseModel {
  final String message;
  final Cart cart;

  AddToCartResponseModel({required this.message, required this.cart});

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) {
    return AddToCartResponseModel(
      message: json['message'] ?? '',
      cart: Cart.fromJson(json['cart']),
    );
  }
}

class Cart {
  final String student;
  final List<CartItem> items;
  final int totalPrice;
  final String id;
  final int v;

  Cart({
    required this.student,
    required this.items,
    required this.totalPrice,
    required this.id,
    required this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      student: json['student'] ?? '',
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      totalPrice: json['totalPrice'] ?? 0,
      id: json['_id'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}

class CartItem {
  final ToolData tool;
  final int quantity;
  final String id;
  final int v;

  CartItem({
    required this.tool,
    required this.quantity,
    required this.id,
    required this.v,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
  return CartItem(
    tool: json['tool'] != null 
        ? ToolData.fromJson(json['tool']) 
        : ToolData.empty(), 
    quantity: json['quantity'] ?? 0,
    id: json['_id'] ?? '',
    v: json['__v'] ?? 0,
  );
}

}
