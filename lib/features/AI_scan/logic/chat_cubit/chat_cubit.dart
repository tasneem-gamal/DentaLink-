import 'package:bloc/bloc.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_request_body.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_response_body.dart';
import 'package:dentalink/features/AI_scan/data/repo/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepo) : super(ChatInitial());

  final ChatRepo chatRepo;

  void sendMessage(ChatRequestBody chatRequestBody) async {
    emit(ChatLoading());

    final response = await chatRepo.sendMessageRepo(chatRequestBody);

    response.fold(
      (failure) {
        emit(ChatFailure(failure.errMessage));
      },
      (chatSuccess) {
        emit(ChatSuccess(chatSuccess));
      },
    );
  }
}
