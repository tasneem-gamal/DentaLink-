import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/auth/forgot_password/data/apis/change_password_service/change_password_api_service.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/change_password/change_password_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/change_password/change_password_response_body.dart';
import 'package:dio/dio.dart';

class ChangePasswordRepo {
  final ChangePasswordApiService changePasswordApiService;

  ChangePasswordRepo(this.changePasswordApiService);

  Future<Either<Failure, ChangePasswordResponseBody>> changePassword(
    ChangePasswordRequestBody changePasswordRequestBody
  ) async{
    try{
      final response = await changePasswordApiService.changePassword(changePasswordRequestBody);
      return right(response);
    } catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }
}