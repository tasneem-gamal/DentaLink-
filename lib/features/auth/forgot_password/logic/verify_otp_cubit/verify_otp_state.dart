part of 'verify_otp_cubit.dart';

class VerifyOtpState {}
class VerifyOtpInitial extends VerifyOtpState{}
class VerifyOtpLoading extends VerifyOtpState{}
class VerifyOtpSuccess extends VerifyOtpState{
  final VerifyOtpResponseBody verifyOtpResponseBody;

  VerifyOtpSuccess(this.verifyOtpResponseBody);
}
class VerifyOtpFailure extends VerifyOtpState{
  final String errMessage;

  VerifyOtpFailure(this.errMessage);

}
