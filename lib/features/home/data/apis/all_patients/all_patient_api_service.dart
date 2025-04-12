import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/all_patients/all_patients_response_body.dart';
import 'package:dio/dio.dart';

class AllPatientApiService {
  late Dio dio;

  AllPatientApiService(){
    dio = DioFactory.getDio();
  }

  Future<AllPatientsResponseBody> allPatientsService() async{
    try{
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.allPatients}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );

      return AllPatientsResponseBody.fromJson(response.data);

    } catch (e){
      throw Exception('Failed to load specializations: $e');
    }
  }
}