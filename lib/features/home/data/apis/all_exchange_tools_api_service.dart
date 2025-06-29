import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:dio/dio.dart';

class AllExchangeToolsApiService {
  late Dio dio;

  AllExchangeToolsApiService(){
    dio = DioFactory.getDio();
  }

  Future<AllExchangeResponseModel> allExchangeToolsService() async {
    try {
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.allExchangeTools}',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );

      final model = AllExchangeResponseModel.fromJson(response.data);

      model.exchanges.sort(
        (a, b) => b.createdAt.compareTo(a.createdAt),
      );

      return model;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

}