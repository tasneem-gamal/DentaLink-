import 'package:bloc/bloc.dart';
import 'package:dentalink/features/home/data/models/add_tool/add_tool_request_body.dart';
import 'package:dentalink/features/home/data/models/add_tool/add_tool_response_body.dart';
import 'package:dentalink/features/home/data/repo/add_tool_repo.dart';

part 'add_tool_state.dart';

class AddToolCubit extends Cubit<AddToolState> {
  AddToolCubit(this.addToolRepo) : super(AddToolInitial());

  final AddToolRepo addToolRepo;

  void addTool(AddToolRequestBody addToolRequestBody) async {
    emit(AddToolLoading());

    final response = await addToolRepo.addNewTool(addToolRequestBody);

    response.fold(
      (failure) {
        emit(AddToolFailure(failure.errMessage));
      },
      (addToolSuccess) {
        emit(AddToolSuccess(addToolSuccess));
      },
    );
  }

}
