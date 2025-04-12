import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/add_patient/add_patient_request_body.dart';
import 'package:dentalink/features/home/data/models/add_patient/add_patient_response_body.dart';
import 'package:dio/dio.dart';

class AddPatientApiService {
  late Dio dio;
  AddPatientApiService(){
    dio = DioFactory.getDio();
  }
  
  Future<AddPatientResponseBody> addPatient(AddPatientRequestBody addPatientRequestBody)async {
    final formData = await addPatientRequestBody.toFormData();
    String? userToken = await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken);

    if (userToken == null || userToken.isEmpty) {
      throw Exception("No token found! User not authenticated.");
    }

    final response = await dio.post(
      '${ApiConstants.baseUrl}${ApiConstants.addpatient}',
      data: formData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "multipart/form-data",
          "Authorization": "Bearer $userToken",
        },
      ),
    );
    return AddPatientResponseBody.fromJson(response.data);
  }
}