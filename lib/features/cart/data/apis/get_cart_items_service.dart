import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/cart/data/models/add_to_cart_response_model.dart';
import 'package:dio/dio.dart';

class GetCartItemsService {
  late Dio dio;
  GetCartItemsService(){
    dio = DioFactory.getDio();
  }

  Future<AddToCartResponseModel> getCartItems() async{
    try{
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.getCartItems}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );

      return AddToCartResponseModel.fromJson(response.data);

    } catch (e){
      throw Exception('Failed to load Items: $e');
    }
  }
}