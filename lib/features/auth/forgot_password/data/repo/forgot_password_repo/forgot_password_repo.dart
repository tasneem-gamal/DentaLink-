import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/auth/forgot_password/data/apis/forgot_password_service/forgot_password_api_service.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/forgot_password/forgot_password_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/forgot_password/forgot_password_response_body.dart';
import 'package:dio/dio.dart';

class ForgotPasswordRepo {
  final ForgotPasswordApiService forgotPasswordApiService;

  ForgotPasswordRepo(this.forgotPasswordApiService);

  Future<Either<Failure, ForgotPasswordResponseBody>> forgotPass(
    ForgotPasswordRequestBody forgotPasswordRequestBody
  ) async{
    try{
      final response = await forgotPasswordApiService.forgotPassword(forgotPasswordRequestBody);
      return right(response);
    } catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }
}