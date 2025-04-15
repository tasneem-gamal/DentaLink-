import 'package:dentalink/features/auth/forgot_password/data/apis/change_password_service/change_password_api_service.dart';
import 'package:dentalink/features/auth/forgot_password/data/apis/forgot_password_service/forgot_password_api_service.dart';
import 'package:dentalink/features/auth/forgot_password/data/apis/resend_otp_service/resend_otp_api_service.dart';
import 'package:dentalink/features/auth/forgot_password/data/apis/verify_otp/verify_otp_api_service.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/change_password/change_password_repo.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/forgot_password_repo/forgot_password_repo.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/resend_otp/resend_otp_repo.dart';
import 'package:dentalink/features/auth/forgot_password/data/repo/verify_otp/verify_otp_repo.dart';
import 'package:dentalink/features/auth/forgot_password/logic/change_password_cubit/change_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/logic/resend_otp_cubit/resend_otp_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/logic/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:dentalink/features/auth/login/data/apis/login_api_service.dart';
import 'package:dentalink/features/auth/login/data/repo/login_repo.dart';
import 'package:dentalink/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:dentalink/features/auth/sign_up/data/apis/sign_api_service.dart';
import 'package:dentalink/features/auth/sign_up/data/repo/sign_repo.dart';
import 'package:dentalink/features/auth/sign_up/logic/sign_cubit/sign_cubit.dart';
import 'package:dentalink/features/home/data/apis/add_patient_service/add_patient_api_service.dart';
import 'package:dentalink/features/home/data/apis/all_patients/all_patient_api_service.dart';
import 'package:dentalink/features/home/data/apis/latest_patients/latest_patients_api_service.dart';
import 'package:dentalink/features/home/data/apis/search/search_api_service.dart';
import 'package:dentalink/features/home/data/repo/add_patient_repo/add_patient_repo.dart';
import 'package:dentalink/features/home/data/repo/all_patients_repo/all_patients_repo.dart';
import 'package:dentalink/features/home/data/repo/latest_patients/latest_patients_repo.dart';
import 'package:dentalink/features/home/data/repo/search_repo/search_repo.dart';
import 'package:dentalink/features/home/logic/add_patient_cubit/add_patient_cubit.dart';
import 'package:dentalink/features/home/logic/all_patients_cubit/all_patients_cubit.dart';
import 'package:dentalink/features/home/logic/latest_patients_cubit/latest_patients_cubit.dart';
import 'package:dentalink/features/home/logic/search_cubit/search_cubit.dart';
import 'package:dentalink/features/profile/data/sign_out/api/sign_out_api_service.dart';
import 'package:dentalink/features/profile/data/sign_out/repo/sign_out_repo.dart';
import 'package:dentalink/features/profile/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpGetIt() {
  //sign
  getIt.registerSingleton<SignApiService>(SignApiService());
  getIt.registerSingleton<SignRepo>(SignRepo(getIt.get<SignApiService>()));
  getIt.registerFactory<SignCubit>(() => SignCubit(getIt()));

  //login
  getIt.registerSingleton<LoginApiService>(LoginApiService());
  getIt.registerSingleton<LoginRepo>(LoginRepo(getIt.get<LoginApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //forgot password
  getIt.registerSingleton<ForgotPasswordApiService>(ForgotPasswordApiService());
  getIt.registerSingleton<ForgotPasswordRepo>(ForgotPasswordRepo(getIt.get<ForgotPasswordApiService>()));
  getIt.registerLazySingleton<FogotPasswordCubit>(() => FogotPasswordCubit(getIt()));

  //verify-otp
  getIt.registerSingleton<VerifyOtpApiService>(VerifyOtpApiService());
  getIt.registerSingleton<VerifyOtpRepo>(VerifyOtpRepo(getIt.get<VerifyOtpApiService>()));
  getIt.registerLazySingleton<VerifyOtpCubit>(() => VerifyOtpCubit(
      getIt<VerifyOtpRepo>(), 
      getIt<FogotPasswordCubit>(),
));

  //change-password
  getIt.registerSingleton<ChangePasswordApiService>(ChangePasswordApiService());
  getIt.registerSingleton<ChangePasswordRepo>(ChangePasswordRepo(getIt.get<ChangePasswordApiService>()));
  getIt.registerLazySingleton<ChangePasswordCubit>(() => ChangePasswordCubit(
    getIt<ChangePasswordRepo>(), 
    getIt<FogotPasswordCubit>(), 
    getIt<VerifyOtpCubit>()
));

  //resend otp
  getIt.registerSingleton<ResendOtpApiService>(ResendOtpApiService());
  getIt.registerSingleton<ResendOtpRepo>(ResendOtpRepo(getIt.get<ResendOtpApiService>()));
  getIt.registerLazySingleton<ResendOtpCubit>(() => ResendOtpCubit(
    getIt<ResendOtpRepo>(), 
    getIt<FogotPasswordCubit>(),
  ));


  //add patient
  getIt.registerSingleton<AddPatientApiService>(AddPatientApiService());
  getIt.registerSingleton<AddPatientRepo>(AddPatientRepo(getIt.get<AddPatientApiService>()));
  getIt.registerLazySingleton<AddPatientCubit>(() => AddPatientCubit(getIt()));

  //all patients
  getIt.registerSingleton<AllPatientApiService>(AllPatientApiService());
  getIt.registerSingleton<AllPatientsRepo>(AllPatientsRepo(getIt.get<AllPatientApiService>()));
  getIt.registerLazySingleton<AllPatientsCubit>(() => AllPatientsCubit(getIt()));

  //latest patients
  getIt.registerSingleton<LatestPatientsApiService>(LatestPatientsApiService());
  getIt.registerSingleton<LatestPatientsRepo>(LatestPatientsRepo(getIt.get<LatestPatientsApiService>()));
  getIt.registerLazySingleton<LatestPatientsCubit>(() => LatestPatientsCubit(getIt()));

  //sign out
  getIt.registerSingleton<SignOutApiService>(SignOutApiService());
  getIt.registerSingleton<SignOutRepo>(SignOutRepo(getIt.get<SignOutApiService>()));
  getIt.registerLazySingleton<SignOutCubit>(() => SignOutCubit(getIt()));

  //search
  getIt.registerSingleton<SearchApiService>(SearchApiService());
  getIt.registerSingleton<SearchRepo>(SearchRepo(getIt.get<SearchApiService>()));
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt()));
}
