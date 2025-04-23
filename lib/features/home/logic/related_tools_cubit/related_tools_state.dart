part of 'related_tools_cubit.dart';

class RelatedToolsState {}

class RelatedToolsInitial extends RelatedToolsState {}
class RelatedToolsLoading extends RelatedToolsState {}
class RelatedToolsSuccess extends RelatedToolsState {
  final List<ToolData> toolDate;

  RelatedToolsSuccess(this.toolDate);
}
class RelatedToolsFailure extends RelatedToolsState {
  final String errMessage;

  RelatedToolsFailure(this.errMessage);
}
