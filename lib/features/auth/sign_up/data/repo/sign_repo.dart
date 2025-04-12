import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/auth/sign_up/data/apis/sign_api_service.dart';
import 'package:dentalink/features/auth/sign_up/data/models/sign_request_body.dart';
import 'package:dentalink/features/auth/sign_up/data/models/sign_response_body.dart';
import 'package:dio/dio.dart';

class SignRepo {
  final SignApiService signApiService;

  SignRepo(this.signApiService);

  Future<Either<Failure, SignResponseBody>> userSign(
      SignRequestBody signUpRequestBody) async {
    try {
      final response = await signApiService.signUp(signUpRequestBody);
      return right(response);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }
}