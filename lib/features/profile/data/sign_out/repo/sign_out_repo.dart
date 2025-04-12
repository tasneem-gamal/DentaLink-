import 'package:dartz/dartz.dart';
import 'package:dentalink/features/profile/data/sign_out/api/sign_out_api_service.dart';
import 'package:dentalink/features/profile/data/sign_out/models/sign_out_request_body.dart';
import 'package:dentalink/features/profile/data/sign_out/models/sign_out_response_body.dart';
import 'package:dio/dio.dart';

import '../../../../../core/networking/api_error_handler.dart';

class SignOutRepo {
  final SignOutApiService signOutApiService;

  SignOutRepo(this.signOutApiService);

  Future<Either<Failure, SignOutResponseBody>> signOut(
    SignOutRequestBody signOutRequestBody
  ) async{
    try{
      final response = await signOutApiService.signOutService(signOutRequestBody);
      return right(response);
    } catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }

}