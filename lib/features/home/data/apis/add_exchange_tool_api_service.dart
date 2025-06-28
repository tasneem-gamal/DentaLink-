import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/exchange/add_exchange_request_body.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:dio/dio.dart';

class AddExchangeToolApiService {
  late Dio dio;
  AddExchangeToolApiService(){
    dio = DioFactory.getDio();
  }
  
  Future<AllExchangeResponseModel> addExchange(AddExchangeRequestBody addExchangeRequestBody)async {
    String? userToken = await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken);

    if (userToken == null || userToken.isEmpty) {
      throw Exception("No token found! User not authenticated.");
    }

    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.addExchanges}',
      data: addExchangeRequestBody.toJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $userToken",
        },
      ),
    );
    return AllExchangeResponseModel.fromJson(response.data);
  }
}