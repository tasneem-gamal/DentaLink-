part of 'all_tools_cubit.dart';

class AllToolsState {}
class AllToolsInitial extends AllToolsState {}
class AllToolsLoading extends AllToolsState {}
class AllToolsSuccess extends AllToolsState {
  final List<ToolData> toolData;

  AllToolsSuccess(this.toolData);
}
class AllToolsFailure extends AllToolsState {
  final String errMessage;

  AllToolsFailure(this.errMessage);
}
