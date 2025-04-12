import 'package:bloc/bloc.dart';
import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/features/auth/login/data/models/login_request_body.dart';
import 'package:dentalink/features/auth/login/data/models/login_response_body.dart';
import 'package:dentalink/features/auth/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void emitLoginStates() async {
    emit(LoginLoading());
    final respose = await loginRepo.userLogin(
      LoginRequestBody(email: emailController.text, password: passwordController.text)
    );
    respose.fold((failure) {
      emit(LoginFailure(failure.errMessage));
    }, (loginSuccess) async {
      await saveUserToken(loginSuccess.accessToken ?? '');
      emit(LoginSuccess(loginSuccess));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPreferenceHelper.setSecuredString(SharedPreferencesKeys.userToken, token);
  }
}
