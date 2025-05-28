part of 'chat_cubit.dart';

class ChatState {}

class ChatInitial extends ChatState {}
class ChatLoading extends ChatState {}
class ChatSuccess extends ChatState {
  final ChatResponseBody chatResponseBody;

  ChatSuccess(this.chatResponseBody);
}
class ChatFailure extends ChatState {
  final String errMessage;

  ChatFailure(this.errMessage);
}
