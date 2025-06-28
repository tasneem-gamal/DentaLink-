import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/home/data/apis/add_exchange_tool_api_service.dart';
import 'package:dentalink/features/home/data/models/exchange/add_exchange_request_body.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:dio/dio.dart';

class AddExchangeToolsRepo {
  final AddExchangeToolApiService addExchangeToolApiService;

  AddExchangeToolsRepo(this.addExchangeToolApiService);

  Future<Either<Failure, AllExchangeResponseModel>> addExchangeTool(
      AddExchangeRequestBody addExchangeRequestBody) async {
    try {
      final response =
          await addExchangeToolApiService.addExchange(addExchangeRequestBody);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
