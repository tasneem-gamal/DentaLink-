import 'package:dartz/dartz.dart';
import 'package:dentalink/features/home/data/apis/latest_patients_api_service.dart';
import 'package:dentalink/features/home/data/models/latest_patients/latest_patients_response_model.dart';

import '../../../../../core/networking/api_error_handler.dart';

class LatestPatientsRepo {
    final LatestPatientsApiService latestPatientsApiService;

  LatestPatientsRepo(this.latestPatientsApiService);

  Future<Either<Failure, LatestPatientsResponseModel>> getLatestPatients() async{
    try{
      final response = await latestPatientsApiService.latestPatientsService();
      return right(response);
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }
}