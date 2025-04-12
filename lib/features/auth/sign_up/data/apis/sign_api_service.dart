import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/auth/sign_up/data/models/sign_request_body.dart';
import 'package:dentalink/features/auth/sign_up/data/models/sign_response_body.dart';
import 'package:dio/dio.dart';

class SignApiService {
  late Dio dio;
  SignApiService() {
    dio = DioFactory.getDio();
  }

  Future<SignResponseBody> signUp(SignRequestBody signRequestBody) async {
    final formData = await signRequestBody.toFormData();

    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.signUp}',
      data: formData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
    return SignResponseBody.fromJson(response.data);
  }
}
