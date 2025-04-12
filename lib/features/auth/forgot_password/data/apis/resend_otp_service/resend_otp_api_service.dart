import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';

class ResendOtpApiService {
  late Dio dio;

  ResendOtpApiService(){
    dio = DioFactory.getDio();
  }

  Future<void> resendOtp(String email) async {
    await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.forgotPassword}',
      data: {"email": email},
    );
  }
}