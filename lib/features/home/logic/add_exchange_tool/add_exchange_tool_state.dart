part of 'add_exchange_tool_cubit.dart';

class AddExchangeToolState {}
class AddExchangeToolInitial extends AddExchangeToolState {}
class AddExchangeToolLoading extends AddExchangeToolState {}
class AddExchangeToolSUccess extends AddExchangeToolState {
  final AllExchangeResponseModel allExchangeResponseModel;

  AddExchangeToolSUccess(this.allExchangeResponseModel);
}
class AddExchangeToolFailure extends AddExchangeToolState {
  final String errMessage;

  AddExchangeToolFailure(this.errMessage);
}
