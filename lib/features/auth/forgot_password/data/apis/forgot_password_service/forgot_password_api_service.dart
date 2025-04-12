import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/forgot_password/forgot_password_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/forgot_password/forgot_password_response_body.dart';
import 'package:dio/dio.dart';

class ForgotPasswordApiService {
  late Dio dio;
  ForgotPasswordApiService(){
    dio = DioFactory.getDio();
  }
  Future<ForgotPasswordResponseBody> forgotPassword(
    ForgotPasswordRequestBody forgotPasswordRequestBody) async {
      final response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.forgotPassword}',
        data: forgotPasswordRequestBody.toJson()
      );
      return ForgotPasswordResponseBody.fromJson(response.data);
    }
}