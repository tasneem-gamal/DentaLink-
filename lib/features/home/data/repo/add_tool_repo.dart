import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/home/data/apis/add_tool_api_service.dart';
import 'package:dentalink/features/home/data/models/add_tool/add_tool_request_body.dart';
import 'package:dentalink/features/home/data/models/add_tool/add_tool_response_body.dart';
import 'package:dio/dio.dart';

class AddToolRepo {
  final AddToolApiService addToolApiService;

  AddToolRepo(this.addToolApiService);

Future<Either<Failure, AddToolResponseBody>> addNewTool(
  AddToolRequestBody addToolRequestBody
) async {
  try {
    final response = await addToolApiService.addTool(addToolRequestBody);
    return right(response);
  } catch (e) {

    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }

    return left(ServerFailure("Unexpected error: ${e.toString()}"));
  }
}
}