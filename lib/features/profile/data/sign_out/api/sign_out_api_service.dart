import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/profile/data/sign_out/models/sign_out_request_body.dart';
import 'package:dentalink/features/profile/data/sign_out/models/sign_out_response_body.dart';
import 'package:dio/dio.dart';

class SignOutApiService {
  late Dio dio;
  SignOutApiService(){
    dio = DioFactory.getDio();
  }

  Future<SignOutResponseBody> signOutService(SignOutRequestBody signOutRequestBody) async{
    final token = await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken);
    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.signOut}',
      options: Options(
        headers: {
          "Authorization": "Bearer $token", 
          "Content-Type": "application/json",
        },
      ),
      data: signOutRequestBody.toJson(),
    );
    return SignOutResponseBody.fromJson(response.data);
  }
}