part of 'resend_otp_cubit.dart';


class ResendOtpState {}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpSuccess extends ResendOtpState {}

class ResendOtpFailure extends ResendOtpState {
  final String errMessage;

  ResendOtpFailure(this.errMessage);
}
