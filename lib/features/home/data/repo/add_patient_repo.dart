import 'package:dartz/dartz.dart';
import 'package:dentalink/core/networking/api_error_handler.dart';
import 'package:dentalink/features/home/data/apis/add_patient_api_service.dart';
import 'package:dentalink/features/home/data/models/add_patient/add_patient_request_body.dart';
import 'package:dentalink/features/home/data/models/add_patient/add_patient_response_body.dart';
import 'package:dio/dio.dart';

class AddPatientRepo {
  final AddPatientApiService addPatientApiService;

  AddPatientRepo(this.addPatientApiService);

Future<Either<Failure, AddPatientResponseBody>> addNewPatient(
  AddPatientRequestBody addPatientRequestBody
) async {
  try {
    final response = await addPatientApiService.addPatient(addPatientRequestBody);
    return right(response);
  } catch (e) {

    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }

    return left(ServerFailure("Unexpected error: ${e.toString()}"));
  }
}
}