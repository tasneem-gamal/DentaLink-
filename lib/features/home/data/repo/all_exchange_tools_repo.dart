import 'package:dartz/dartz.dart';
import 'package:dentalink/features/home/data/apis/all_exchange_tools_api_service.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';

class AllExchangeToolsRepo {
    final AllExchangeToolsApiService allExchangeToolsApiService;

  AllExchangeToolsRepo(this.allExchangeToolsApiService);

  Future<Either<Failure, AllExchangeResponseModel>> getAllExchangeTools() async{
    try{
      final response = await allExchangeToolsApiService.allExchangeToolsService();
      return right(response);
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }
}