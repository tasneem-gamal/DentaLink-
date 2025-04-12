import 'package:dentalink/features/home/logic/all_patients_cubit/all_patients_cubit.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patients_grid_view.dart';
import 'package:dentalink/features/home/ui/widgets/patients/patients_shimmer_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPaientsBlocBuilder extends StatelessWidget {
  const AllPaientsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllPatientsCubit, AllPatientsState>(
      buildWhen: (previous, current) => 
        current is AllPatientsLoading ||
        current is AllPatientsSuccess || 
        current is AllPatientsFailure,
      builder: (context, state) {
        if(state is AllPatientsLoading){
          return const PatientsShimmerGridView();
        }
        else if(state is AllPatientsSuccess){
          return PatientsGridView(
            patientData: state.patientData
          );
        } else if(state is AllPatientsFailure){
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
