import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/auth/login/data/apis/login_api_service.dart';
import 'package:dentalink/features/auth/login/data/models/login_request_body.dart';
import 'package:dentalink/features/auth/login/data/models/login_response_body.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final LoginApiService loginApiService;

  LoginRepo(this.loginApiService);

  Future<Either<Failure, LoginResponseBody>> userLogin(
    LoginRequestBody loginRequestBody
  ) async{
    try{
      final response = await loginApiService.login(loginRequestBody);
      return right(response);
    } catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }
}