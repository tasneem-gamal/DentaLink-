import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/widgets/head_welcome_text_auth.dart';
import 'package:dentalink/features/auth/forgot_password/logic/forgot_password_cubit/fogot_password_cubit.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/otp_boxes.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/resend_code_row.dart';
import 'package:dentalink/features/auth/forgot_password/ui/widgets/verify_otp_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordOtpViewBody extends StatefulWidget {
  const ForgotPasswordOtpViewBody({super.key});

  @override
  State<ForgotPasswordOtpViewBody> createState() => _ForgotPasswordOtpViewBodyState();
}

class _ForgotPasswordOtpViewBodyState extends State<ForgotPasswordOtpViewBody> {
  late FogotPasswordCubit fogotPasswordCubit ;

  @override
  void initState() {
    fogotPasswordCubit = context.read<FogotPasswordCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset('assets/images/dentalink.png'),
          HeadWelcomeTextAuth(
            title: 'Reset Password',
            subTitle: "Code has been sent to ${fogotPasswordCubit.userEmail ?? 'your email'}",
          ),
          verticalSpace(18),
          const OtpBoxes(),
          verticalSpace(14),
          const ResendCodeRow(),
          const VerifyOtpBlocListner()
        ],
      )),
    );
  }
}
