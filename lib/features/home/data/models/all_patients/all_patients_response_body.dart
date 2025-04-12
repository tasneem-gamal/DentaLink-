
import 'package:dentalink/features/home/data/models/patient_data.dart';

class AllPatientsResponseBody {
  List<PatientData>? patientData;
  
  AllPatientsResponseBody({
    this.patientData
  });

  factory AllPatientsResponseBody.fromJson(List<dynamic> json) {
    return AllPatientsResponseBody(
      patientData: json.map((e) => PatientData.fromJson(e)).toList(),
    );
  }

}

