part of 'all_exchange_tools_cubit.dart';

class AllExchangeToolsState {}
class AllExchangeToolsInitial extends AllExchangeToolsState {}
class AllExchangeToolsLoading extends AllExchangeToolsState {}
class AllExchangeToolsSuccess extends AllExchangeToolsState {
  final List<ExchangeData> allExchanges;

  AllExchangeToolsSuccess(this.allExchanges);
}
class AllExchangeToolsFailure extends AllExchangeToolsState {
  final String errMessage;

  AllExchangeToolsFailure(this.errMessage);
}
