import 'package:bloc/bloc.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:dentalink/features/home/data/repo/all_tools/all_tools_repo.dart';

part 'all_tools_state.dart';

class AllToolsCubit extends Cubit<AllToolsState> {
  AllToolsCubit(this.allToolsRepo) : super(AllToolsInitial());

  final AllToolsRepo allToolsRepo;
  List<ToolData> toolDataList = [];

  void getTools() async{
    emit(AllToolsLoading());
    final response = await allToolsRepo.getAllTools();
    response.fold(
      (failure){
        emit(AllToolsFailure(failure.errMessage));
      },
      (allToolsResponse){
        toolDataList = allToolsResponse.toolData!;
        emit(AllToolsSuccess(toolDataList));
      }
    );
  }
}
