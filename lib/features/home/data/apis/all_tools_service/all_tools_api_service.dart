import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/all_tools/all_tools_response_body.dart';
import 'package:dio/dio.dart';

class AllToolsApiService {
  late Dio dio;
  AllToolsApiService(){
    dio = DioFactory.getDio();
  }

  Future<AllToolsResponseBody> allToolsService() async{
    try{
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.allTools}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );

      return AllToolsResponseBody.fromJson(response.data);

    } catch (e){
      throw Exception('Failed to load Tools: $e');
    }
  }
}