part of 'sign_out_cubit.dart';

class SignOutState {}

class SignOutInitial extends SignOutState {}
class SignOutLoading extends SignOutState {}
class SignOutSuccess extends SignOutState {
  final SignOutResponseBody signOutResponseBody;

  SignOutSuccess(this.signOutResponseBody);
}
class SignOutFailure extends SignOutState {
  final String errMessage;

  SignOutFailure(this.errMessage);
}
