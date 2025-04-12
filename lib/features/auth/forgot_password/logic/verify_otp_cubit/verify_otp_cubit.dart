import 'package:bloc/bloc.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/verify_otp/verify_otp_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/verify_otp/verify_otp_response_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/verify_otp/verify_otp_repo.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';
import 'package:flutter/material.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this.verifyOtpRepo, this.fogotPasswordCubit) : super(VerifyOtpInitial());

  final VerifyOtpRepo verifyOtpRepo;
  final TextEditingController otpController = TextEditingController();
  final FogotPasswordCubit fogotPasswordCubit;
  String? userOtp;


  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }

  void emitVerifyOtpState()async {
    emit(VerifyOtpLoading());
    final respose = await verifyOtpRepo.verifyOtp(
      VerifyOtpRequestBody(
        oTP: otpController.text,
        email: fogotPasswordCubit.userEmail ?? ""
      )
    );
    respose.fold((failure) {
      emit(VerifyOtpFailure(failure.errMessage));
    }, (loginSuccess) async {
      userOtp = otpController.text;
      emit(VerifyOtpSuccess(loginSuccess));
    });
  }
}
