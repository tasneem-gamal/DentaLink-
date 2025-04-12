import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/networking/api_constants.dart';
import 'package:dentalink/core/networking/dio_factory.dart';
import 'package:dentalink/features/home/data/models/latest_patients/latest_patients_response_model.dart';
import 'package:dio/dio.dart';

class LatestPatientsApiService {
  late Dio dio;

  LatestPatientsApiService(){
    dio = DioFactory.getDio();
  }

  Future<LatestPatientsResponseModel> latestPatientsService() async{
    try{
      final response = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.latestPatients}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken)}',
          },
        ),
      );
      return LatestPatientsResponseModel.fromJson(response.data);

    } catch (e){
      throw Exception('Failed to load data: $e');
    }
  }
}