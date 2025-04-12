import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/auth/login/data/models/login_request_body.dart';
import 'package:dentalink/features/auth/login/data/models/login_response_body.dart';
import 'package:dio/dio.dart';

class LoginApiService {
  late Dio dio;
  LoginApiService(){
    dio = DioFactory.getDio();
  }

  Future<LoginResponseBody> login(LoginRequestBody loginRequestBody) async{
    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.login}',
      data: loginRequestBody.toJson()
    );
    return LoginResponseBody.fromJson(response.data);
  }
}