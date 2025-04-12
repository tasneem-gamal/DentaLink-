import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dentalink/features/auth/sign_up/data/models/sign_request_body.dart';
import 'package:dentalink/features/auth/sign_up/data/models/sign_response_body.dart';
import 'package:dentalink/features/auth/sign_up/data/repo/sign_repo.dart';
import 'package:flutter/material.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit(this.signupRepo) : super(SignInitial());

  final SignRepo signupRepo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController selectedYear = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  File? imageFile;
  final GlobalKey<FormState> signFormKey = GlobalKey();

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    selectedYear.dispose();
    studentIdController.dispose();
    return super.close();
  }

  Future<void> emitSignState() async {
    if (signFormKey.currentState?.validate() != true) {
      return;
    }

    if (imageFile == null) {
      emit(SignFailure("Please upload your Student ID."));
      return;
    }

    emit(SignLoading());

    try {
      final response = await signupRepo.userSign(
        SignRequestBody(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          academicYear: selectedYear.text,
          universityID: studentIdController.text,
          idPicture: imageFile!,
          role: 'Student',
        ),
      );

      response.fold(
        (failure) => emit(SignFailure(failure.errMessage)),
        (success) => emit(SignSuccess(success)),
      );
    } catch (e) {
      emit(SignFailure("Invalid input data"));
    }
  }
}
