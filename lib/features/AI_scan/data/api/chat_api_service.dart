import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_request_body.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_response_body.dart';
import 'package:dio/dio.dart';

class ChatApiService {
  late Dio dio;
  ChatApiService(){
    dio = DioFactory.getDio();
  }

  Future<ChatResponseBody> sendMessage(ChatRequestBody chatRequestBody) async{
    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.aiChat}',
      data: chatRequestBody.toJson(),
      options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        )
    );
    return ChatResponseBody.fromJson(response.data);
  }
}