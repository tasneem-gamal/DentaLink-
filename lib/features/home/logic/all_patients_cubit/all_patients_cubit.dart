import 'package:bloc/bloc.dart';
import 'package:dentalink/features/home/data/models/patient_data.dart';
import 'package:dentalink/features/home/data/repo/all_patients_repo.dart';

part 'all_patients_state.dart';

class AllPatientsCubit extends Cubit<AllPatientsState> {
  AllPatientsCubit(this.allPatientsRepo) : super(AllPatientsInitial());

  final AllPatientsRepo allPatientsRepo;
  List<PatientData> patientDataList = [];

  void getPatients() async{
    emit(AllPatientsLoading());
    final response = await allPatientsRepo.getAllPatients();
    response.fold(
      (failure){
        emit(AllPatientsFailure(failure.errMessage));
      },
      (allPatientsResponse){
        patientDataList = allPatientsResponse.patientData!;
        emit(AllPatientsSuccess(patientDataList));
      }
    );
  }
}
