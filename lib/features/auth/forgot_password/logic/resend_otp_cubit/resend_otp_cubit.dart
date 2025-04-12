import 'package:bloc/bloc.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/resend_otp/resend_otp_repo.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit(this.resendOtpRepo, this.fogotPasswordCubit) : super(ResendOtpInitial());

  final ResendOtpRepo resendOtpRepo;
  final FogotPasswordCubit fogotPasswordCubit;

  void resendOtp() async {
    emit(ResendOtpLoading());
    final response = await resendOtpRepo.resendOtp(fogotPasswordCubit.userEmail ?? "");

    response.fold(
      (failure) => emit(ResendOtpFailure(failure.errMessage)),
      (success) => emit(ResendOtpSuccess()),
    );
  }
}
