import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/all_exchange_tools/exchange_response_body.dart';
import 'package:dio/dio.dart';

class ExchangeApiService {
  late Dio dio;

  ExchangeApiService(){
    dio = DioFactory.getDio();
  }

  Future<ExchangeResponseBody> exchangeService() async{
    try{
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.allExchangeTools}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );
      return ExchangeResponseBody.fromJson(response.data);

    } catch (e){
      throw Exception('Failed to load data: $e');
    }
  }
}