part of 'add_to_cart_cubit.dart';

class AddToCartState {}
class AddToCartInitial extends AddToCartState {}
class AddToCartLoading extends AddToCartState {}
class AddToCartSuccess extends AddToCartState {
  final AddToCartResponseModel addToCartResponseModel;

  AddToCartSuccess(this.addToCartResponseModel);
}
class AddToCartFailure extends AddToCartState {
  final String errMessage;

  AddToCartFailure(this.errMessage);
}
