import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/home/data/apis/related_tools_api_service.dart';
import 'package:dentalink/features/home/data/models/related_tools/related_tools_response_body.dart';

class RelatedToolsRepo {
  final RelatedToolsApiService relatedToolsApiService;

  RelatedToolsRepo(this.relatedToolsApiService);

  Future<Either<Failure, RelatedToolsResponseBody>> getRelatedTools(
      {required String toolId}) async {
    try {
      final response = await relatedToolsApiService.relatedToolsService(toolId: toolId);
      
      return right(response);
    } catch (e) {
      
      return left(ServerFailure(e.toString()));
    }
  }
}