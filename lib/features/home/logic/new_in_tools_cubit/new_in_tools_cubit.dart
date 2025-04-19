import 'package:bloc/bloc.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:dentalink/features/home/data/repo/new_in_tools/new_in_tools_repo.dart';

part 'new_in_tools_state.dart';

class NewInToolsCubit extends Cubit<NewInToolsState> {
  NewInToolsCubit(this.newInToolsRepo) : super(NewInToolsInitial());

  final NewInToolsRepo newInToolsRepo;
  List<ToolData> toolDataList = [];

  void getNewInTools() async{
    emit(NewInToolsLoading());
    final response = await newInToolsRepo.getNewInTools();
    response.fold(
      (failure){
        emit(NewInToolsFailure(failure.errMessage));
      },
      (newInTools){
        toolDataList = newInTools.toolData!;
        emit(NewInToolsSuccess(toolDataList));
      }
    );
  }
}
