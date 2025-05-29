import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_request_body.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_response_body.dart';
import 'package:dio/dio.dart';

class ChatApiService {
  late Dio dio;
  ChatApiService() {
    dio = DioFactory.getDio();
  }

  Future<ChatResponseBody> sendMessage(ChatRequestBody chatRequestBody) async {
    final formData = FormData.fromMap({
      'message': chatRequestBody.message,
      if (chatRequestBody.chatId != null) 'chatId': chatRequestBody.chatId,
      if (chatRequestBody.image != null)
        'image': await MultipartFile.fromFile(
          chatRequestBody.image!.path,
          filename: chatRequestBody.image!.path.split('/').last,
        ),
    });

    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.aiChat}',
      data: formData,
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    return ChatResponseBody.fromJson(response.data);
  }
}
