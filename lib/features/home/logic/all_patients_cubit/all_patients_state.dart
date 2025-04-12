part of 'all_patients_cubit.dart';

class AllPatientsState {}

class AllPatientsInitial extends AllPatientsState {}
class AllPatientsLoading extends AllPatientsState {}
class AllPatientsSuccess extends AllPatientsState {
  final List<PatientData> patientData;

  AllPatientsSuccess(this.patientData);
}
class AllPatientsFailure extends AllPatientsState {
  final String errMessage;

  AllPatientsFailure(this.errMessage);
}
