import 'package:bloc/bloc.dart';
import 'package:dentalink/features/home/data/models/tool_data.dart';
import 'package:dentalink/features/home/data/repo/related_tools/related_tools_repo.dart';

part 'related_tools_state.dart';

class RelatedToolsCubit extends Cubit<RelatedToolsState> {
  RelatedToolsCubit(this.relatedToolsRepo) : super(RelatedToolsInitial());

  final RelatedToolsRepo relatedToolsRepo;

  List<ToolData> toolDataList = [];

  void getRelatedTools(ToolData toolId) async{
    emit(RelatedToolsLoading());
    final response = await relatedToolsRepo.getRelatedTools(toolId: toolId.id);
    response.fold(
      (failure){
        emit(RelatedToolsFailure(failure.errMessage));
      },
      (newInTools){
        toolDataList = newInTools.toolData!;
        emit(RelatedToolsSuccess(toolDataList));
      }
    );
  }
}
