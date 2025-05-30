import 'package:dartz/dartz.dart';
import 'package:dentalink/features/home/data/apis/all_exchange_tools/all_exchange_tools_api_service.dart';
import 'package:dentalink/features/home/data/models/all_exchange_tools/all_exchange_tools_response_body.dart';

import '../../../../../core/networking/api_error_handler.dart';

class AllExchangeToolsRepo {
    final AllExchangeToolsApiService allExchangeToolsApiService;

  AllExchangeToolsRepo(this.allExchangeToolsApiService);

  Future<Either<Failure, AllExchangeToolsResponseBody>> getAllExchangeTools() async{
    try{
      final response = await allExchangeToolsApiService.allExchangeToolsService();
      return right(response);
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }
}