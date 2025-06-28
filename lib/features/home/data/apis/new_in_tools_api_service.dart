import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/new_in_tools/new_in_tools_response_body.dart';
import 'package:dio/dio.dart';

class NewInToolsApiService {
  late Dio dio;
  NewInToolsApiService(){
    dio = DioFactory.getDio();
  } 

  Future<NewInToolsResponseBody> newInToolsService() async{
    try{
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.newInTools}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );
      return NewInToolsResponseBody.fromJson(response.data);

    } catch (e){
      throw Exception('Failed to load data: $e');
    }
  }
}