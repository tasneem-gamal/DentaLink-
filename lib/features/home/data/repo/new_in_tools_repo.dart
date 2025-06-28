import 'package:dartz/dartz.dart';
import 'package:dentalink/features/home/data/apis/new_in_tools_api_service.dart';
import 'package:dentalink/features/home/data/models/new_in_tools/new_in_tools_response_body.dart';

import '../../../../core/networking/api_error_handler.dart';

class NewInToolsRepo {
    final NewInToolsApiService newInToolsApiService;

  NewInToolsRepo(this.newInToolsApiService);

  Future<Either<Failure, NewInToolsResponseBody>> getNewInTools() async{
    try{
      final response = await newInToolsApiService.newInToolsService();
      return right(response);
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }
}