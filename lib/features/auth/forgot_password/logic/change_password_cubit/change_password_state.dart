part of 'change_password_cubit.dart';

class ChangePasswordState {}
class ChangePasswordInitial extends ChangePasswordState{}
class ChangePasswordLoading extends ChangePasswordState{}
class ChangePasswordSuccess extends ChangePasswordState{
  final ChangePasswordResponseBody changePasswordResponseBody;

  ChangePasswordSuccess(this.changePasswordResponseBody);
}
class ChangePasswordFailure extends ChangePasswordState{
  final String errMessage;

  ChangePasswordFailure(this.errMessage);

}

