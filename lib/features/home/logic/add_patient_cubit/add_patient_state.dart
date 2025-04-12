part of 'add_patient_cubit.dart';

class AddPatientState {}
class AddPatientInitial extends AddPatientState{}
class AddPatientLoading extends AddPatientState{}
class AddPatientSuccess extends AddPatientState{
  final AddPatientResponseBody addPatientResponseBody;

  AddPatientSuccess(this.addPatientResponseBody);
}
class AddPatientFailure extends AddPatientState{
  final String errMessage;

  AddPatientFailure(this.errMessage);
}
class AddPatientGenderUpdated extends AddPatientState {}
