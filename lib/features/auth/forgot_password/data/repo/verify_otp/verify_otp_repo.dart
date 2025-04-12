import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/auth/forgot_password/data/apis/verify_otp/verify_otp_api_service.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/verify_otp/verify_otp_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/verify_otp/verify_otp_response_body.dart';
import 'package:dio/dio.dart';

class VerifyOtpRepo {
  final VerifyOtpApiService verifyOtpApiService;

  VerifyOtpRepo(this.verifyOtpApiService);

  Future<Either<Failure, VerifyOtpResponseBody>> verifyOtp(
    VerifyOtpRequestBody verifyOtpRequestBody
  ) async{
    try{
      final response = await verifyOtpApiService.verifyOtp(verifyOtpRequestBody);
      return right(response);
    } catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }
}