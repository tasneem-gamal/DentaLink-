import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/auth/forgot_password/data/apis/resend_otp_service/resend_otp_api_service.dart';
import 'package:dio/dio.dart';

class ResendOtpRepo {
  final ResendOtpApiService resendOtpApiService;

  ResendOtpRepo(this.resendOtpApiService);

  Future<Either<Failure, void>> resendOtp(String email) async {
    try {
      await resendOtpApiService.resendOtp(email);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }
}