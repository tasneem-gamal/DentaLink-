import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/cart/data/apis/get_cart_items_service.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_response_model.dart';

class GetCartItemsRepo {
  final GetCartItemsService getCartItemsService;

  GetCartItemsRepo(this.getCartItemsService);

  Future<Either<Failure, AddToCartResponseModel>> getCartItems() async{
    try{
      final response = await getCartItemsService.getCartItems();
      return right(response);
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }
}