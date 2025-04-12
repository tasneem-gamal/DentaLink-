import 'package:bloc/bloc.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/change_password/change_password_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/change_password/change_password_response_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/change_password/change_password_repo.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/logic/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:flutter/material.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordRepo, this.fogotPasswordCubit, this.verifyOtpCubit) : super(ChangePasswordInitial());

  final ChangePasswordRepo changePasswordRepo;
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey();
  final FogotPasswordCubit fogotPasswordCubit;
  final VerifyOtpCubit verifyOtpCubit;
  
  @override
  Future<void> close() {
    passwordController.dispose();
    return super.close();
  }

  void emitChangepasswordState()async {
    emit(ChangePasswordLoading());
    final respose = await changePasswordRepo.changePassword(
      ChangePasswordRequestBody(
        email: fogotPasswordCubit.userEmail ?? '', 
        oTP: verifyOtpCubit.userOtp ?? '', 
        newPassword: passwordController.text
      )
    );
    respose.fold((failure) {
      emit(ChangePasswordFailure(failure.errMessage));
    }, (loginSuccess) async {
      emit(ChangePasswordSuccess(loginSuccess));
    });
  }
}
