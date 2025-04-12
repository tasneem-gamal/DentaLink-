import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/auth/forgot_password/logic/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpBoxes extends StatefulWidget {
  const OtpBoxes({
    super.key,
  });

  @override
  State<OtpBoxes> createState() => _OtpBoxesState();
}

class _OtpBoxesState extends State<OtpBoxes> {

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      controller: context.read<VerifyOtpCubit>().otpController,
      pinAnimationType: PinAnimationType.fade,
      onCompleted: (value){},
      defaultPinTheme: PinTheme(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorsManager.moreLightGray)
        )
      ),
    );
  }
}