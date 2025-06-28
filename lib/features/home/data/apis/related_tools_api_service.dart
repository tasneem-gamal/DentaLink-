import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/related_tools/related_tools_response_body.dart';
import 'package:dio/dio.dart';

class RelatedToolsApiService {
  late Dio dio;
  RelatedToolsApiService(){
    dio = DioFactory.getDio();
  }

  Future<RelatedToolsResponseBody> relatedToolsService({required String toolId}) async{
    try{
      final response = await dio.get(
        '${ApiConstants.baseUrl}tools/$toolId/related',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );
      return RelatedToolsResponseBody.fromJson(response.data);

    } catch (e){
      throw Exception('Failed to load data: $e');
    }
  }

}