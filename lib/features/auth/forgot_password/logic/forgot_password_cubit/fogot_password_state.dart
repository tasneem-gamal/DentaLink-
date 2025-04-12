part of 'fogot_password_cubit.dart';

class FogotPasswordState {}
class FogotPasswordInitial extends FogotPasswordState{}
class FogotPasswordLoading extends FogotPasswordState{}
class FogotPasswordSuccess extends FogotPasswordState{
  final ForgotPasswordResponseBody forgotPasswordResponseBody ;

  FogotPasswordSuccess(this.forgotPasswordResponseBody);
}
class FogotPasswordFailure extends FogotPasswordState{
  final String errMessage;

  FogotPasswordFailure(this.errMessage);

}