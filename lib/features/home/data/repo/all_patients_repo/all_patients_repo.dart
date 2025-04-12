import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/home/data/apis/all_patients/all_patient_api_service.dart';
import 'package:dentalink/features/home/data/models/all_patients/all_patients_response_body.dart';

class AllPatientsRepo {
  final AllPatientApiService allPatientApiService;

  AllPatientsRepo(this.allPatientApiService);

  Future<Either<Failure, AllPatientsResponseBody>> getAllPatients() async{
    try{
      final response = await allPatientApiService.allPatientsService();
      return right(response);
    } catch (e){
      return left(ServerFailure(e.toString()));
    }
  }
}