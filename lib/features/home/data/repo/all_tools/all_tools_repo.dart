import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/home/data/apis/all_tools_service/all_tools_api_service.dart';
import 'package:dentalink/features/home/data/models/all_tools/all_tools_response_body.dart';

class AllToolsRepo {
  final AllToolsApiService allToolsApiService;

  AllToolsRepo(this.allToolsApiService);

  Future<Either<Failure, AllToolsResponseBody>> getAllTools() async{
    try{
      final response = await allToolsApiService.allToolsService();
      return right(response);
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }
}