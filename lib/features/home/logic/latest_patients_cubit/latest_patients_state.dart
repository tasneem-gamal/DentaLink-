part of 'latest_patients_cubit.dart';

class LatestPatientsState {}

class LatestPatientsInitial extends LatestPatientsState {}
class LatestPatientsLoading extends LatestPatientsState {}
class LatestPatientsSuccess extends LatestPatientsState {
  final List<PatientData> patientData;

  LatestPatientsSuccess(this.patientData);
}
class LatestPatientsFailure extends LatestPatientsState {
  final String errMessage;

  LatestPatientsFailure(this.errMessage);
}

