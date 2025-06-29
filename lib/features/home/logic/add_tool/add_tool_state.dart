part of 'add_tool_cubit.dart';

class AddToolState {}
class AddToolInitial extends AddToolState {}
class AddToolLoading extends AddToolState {}
class AddToolSuccess extends AddToolState {
  final AddToolResponseBody addToolResponseBody;

  AddToolSuccess(this.addToolResponseBody);
}
class AddToolFailure extends AddToolState {
  final String errMessage;

  AddToolFailure(this.errMessage);
}
