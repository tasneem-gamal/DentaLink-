import 'package:dentalink/features/home/logic/latest_patients_cubit/latest_patients_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/latest_cases_list_view.dart';
import 'package:dentalink/features/home/ui/widgets/main_home_screen/latest_cases_shimmer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestPatientsBlocBuilder extends StatelessWidget {
  const LatestPatientsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestPatientsCubit, LatestPatientsState>(
      buildWhen: (previous, current) => 
        current is LatestPatientsLoading ||
        current is LatestPatientsSuccess || 
        current is LatestPatientsFailure,
      builder: (context, state) {
        if(state is LatestPatientsLoading){
          return const LatestCasesShimmerListView();
        }
        else if(state is LatestPatientsSuccess){
          return LatestCasesListView(
            patientData: state.patientData
          );
        } else if(state is LatestPatientsFailure){
          return SizedBox(
            child: Text(state.errMessage),
          );
        } else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
