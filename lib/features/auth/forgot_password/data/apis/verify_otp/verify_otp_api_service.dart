import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/verify_otp/verify_otp_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/verify_otp/verify_otp_response_body.dart';
import 'package:dio/dio.dart';

class VerifyOtpApiService {
  late Dio dio;

  VerifyOtpApiService(){
    dio = DioFactory.getDio();
  }

  Future<VerifyOtpResponseBody> verifyOtp(
    VerifyOtpRequestBody verifyOtpRequestBody) async {
      final response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.verifyOtp}',
        data: verifyOtpRequestBody.toJson()
      );
      return VerifyOtpResponseBody.fromJson(response.data);
    }
}