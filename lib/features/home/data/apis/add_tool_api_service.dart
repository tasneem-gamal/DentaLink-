import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/add_tool/add_tool_request_body.dart';
import 'package:dentalink/features/home/data/models/add_tool/add_tool_response_body.dart';
import 'package:dio/dio.dart';

class AddToolApiService {
  late Dio dio;
  AddToolApiService(){
    dio = DioFactory.getDio();
  }
  
  Future<AddToolResponseBody> addTool(AddToolRequestBody addToolRequestBody)async {
    final formData = await addToolRequestBody.toFormData();
    String? userToken = await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken);

    if (userToken == null || userToken.isEmpty) {
      throw Exception("No token found! User not authenticated.");
    }

    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.addTool}',
      data: formData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "multipart/form-data",
          "Authorization": "Bearer $userToken",
        },
      ),
    );
    return AddToolResponseBody.fromJson(response.data);
  }
}