part of 'new_in_tools_cubit.dart';

class NewInToolsState {}
class NewInToolsInitial extends NewInToolsState {}
class NewInToolsLoading extends NewInToolsState {}
class NewInToolsSuccess extends NewInToolsState {
  final List<ToolData> toolDate;

  NewInToolsSuccess(this.toolDate);
}
class NewInToolsFailure extends NewInToolsState {
  final String errMessage;

  NewInToolsFailure(this.errMessage);
}
