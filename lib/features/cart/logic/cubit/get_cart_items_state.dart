part of 'get_cart_items_cubit.dart';

class GetCartItemsState {}
class GetCartItemsInitial extends GetCartItemsState {}
class GetCartItemsLoading extends GetCartItemsState {}
class GetCartItemsSuccess extends GetCartItemsState {
  final List<CartItem> cartItems;

  GetCartItemsSuccess(this.cartItems);
}
class GetCartItemsFailure extends GetCartItemsState {
  final String errMessage;

  GetCartItemsFailure(this.errMessage);
}
