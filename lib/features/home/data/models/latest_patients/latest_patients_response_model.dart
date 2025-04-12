
import 'package:dentalink/features/home/data/models/patient_data.dart';

class LatestPatientsResponseModel {
  List<PatientData>? patientData;

  LatestPatientsResponseModel({
    this.patientData
  });

    factory LatestPatientsResponseModel.fromJson(List<dynamic> json) {
    return LatestPatientsResponseModel(
      patientData: json.map((e) => PatientData.fromJson(e)).toList(),
    );
  }
}

