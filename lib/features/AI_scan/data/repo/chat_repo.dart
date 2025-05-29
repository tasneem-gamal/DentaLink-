import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/AI_scan/data/api/chat_api_service.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_request_body.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_response_body.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  final ChatApiService chatApiService;

  ChatRepo(this.chatApiService);

  Future<Either<Failure, ChatResponseBody>> sendMessageRepo(
      ChatRequestBody chatRequestBody) async {
    try {
      final response = await chatApiService.sendMessage(chatRequestBody);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
