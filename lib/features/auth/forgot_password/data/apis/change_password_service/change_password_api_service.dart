import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/change_password/change_password_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/change_password/change_password_response_body.dart';
import 'package:dio/dio.dart';

class ChangePasswordApiService {
  late Dio dio;

  ChangePasswordApiService(){
    dio = DioFactory.getDio();
  }

  Future<ChangePasswordResponseBody> changePassword(
    ChangePasswordRequestBody changePasswordRequestBody) async {
      final response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.changePassword}',
        data: changePasswordRequestBody.toJson()
      );
      return ChangePasswordResponseBody.fromJson(response.data);
    }
}