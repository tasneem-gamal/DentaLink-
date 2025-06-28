import 'package:bloc/bloc.dart';
import 'package:dentalink/features/home/data/models/exchange/add_exchange_request_body.dart';
import 'package:dentalink/features/home/data/models/exchange/all_exchange_response_model.dart';
import 'package:dentalink/features/home/data/repo/add_exchange_tools_repo.dart';

part 'add_exchange_tool_state.dart';

class AddExchangeToolCubit extends Cubit<AddExchangeToolState> {
  AddExchangeToolCubit(this.addExchangeToolsRepo) : super(AddExchangeToolInitial());

  final AddExchangeToolsRepo addExchangeToolsRepo;

  void addExchangeTool(AddExchangeRequestBody addExchangeRequestBody) async {
    emit(AddExchangeToolLoading());

    final response = await addExchangeToolsRepo.addExchangeTool(addExchangeRequestBody);

    response.fold(
      (failure) {
        emit(AddExchangeToolFailure(failure.errMessage));
      },
      (addExchangeSuccess) {
        emit(AddExchangeToolSUccess(addExchangeSuccess));
      },
    );
  }
}
