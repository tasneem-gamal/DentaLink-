part of 'login_cubit.dart';

class LoginState {}
class LoginInitial extends LoginState{}
class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{
  final LoginResponseBody loginResponseBody;

  LoginSuccess(this.loginResponseBody);
}
class LoginFailure extends LoginState{
  final String errMessage;

  LoginFailure(this.errMessage);

}