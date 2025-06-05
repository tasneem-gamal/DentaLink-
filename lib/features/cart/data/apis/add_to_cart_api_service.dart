import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_response_model.dart';
import 'package:dio/dio.dart';

class AddToCartApiService {
  late Dio dio;

  AddToCartApiService(){
    dio = DioFactory.getDio();
  }

  Future<AddToCartResponseModel> addToCartService(AddToCartRequestModel addToCartRequestModel) async{
    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.addToCart}',
      options: Options(
        headers: {
          "Authorization": "Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}",
        },
      )
    );
    return AddToCartResponseModel.fromJson(response.data);
  }
}