import 'package:bloc/bloc.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/forgot_password/forgot_password_request_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/models/forgot_password/forgot_password_response_body.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/forgot_password_repo/forgot_password_repo.dart';
import 'package:flutter/material.dart';

part 'fogot_password_state.dart';

class FogotPasswordCubit extends Cubit<FogotPasswordState> {
  FogotPasswordCubit(this.forgotPasswordRepo) : super(FogotPasswordInitial());

  final ForgotPasswordRepo forgotPasswordRepo;
  String? userEmail;

  final TextEditingController emailController = TextEditingController();


  void emitForgotPasswordState()async {
    emit(FogotPasswordLoading());
    final respose = await forgotPasswordRepo.forgotPass(
      ForgotPasswordRequestBody(email: emailController.text)
    );
    respose.fold((failure) {
      emit(FogotPasswordFailure(failure.errMessage));
      
    }, (loginSuccess) async {
      userEmail = emailController.text;
      emit(FogotPasswordSuccess(loginSuccess));
    });
  }

}
