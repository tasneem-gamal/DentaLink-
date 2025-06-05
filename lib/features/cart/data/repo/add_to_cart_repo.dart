import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/cart/data/apis/add_to_cart_api_service.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_response_model.dart';
import 'package:dio/dio.dart';

class AddToCartRepo {
  final AddToCartApiService addToCartApiService;

  AddToCartRepo(this.addToCartApiService);

  Future<Either<Failure, AddToCartResponseModel>> addToCart(
      AddToCartRequestModel addToCartRequestModel) async {
    try {
      final response =
          await addToCartApiService.addToCartService(addToCartRequestModel);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
