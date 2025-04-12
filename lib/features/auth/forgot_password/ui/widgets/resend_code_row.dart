import 'dart:async';

import 'package:dentalink/core/theming/styles.dart';
import 'package:dentalink/features/auth/forgot_password/logic/resend_otp_cubit/resend_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendCodeRow extends StatefulWidget {
  const ResendCodeRow({
    super.key,
  });

  @override
  State<ResendCodeRow> createState() => _ResendCodeRowState();
}

class _ResendCodeRowState extends State<ResendCodeRow> {
  
  bool _isButtonDisabled = false;
  int _secondsRemaining = 60;
  Timer? _timer;
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn’t get your code?',
          style: CustomTextStyles.font14BlackRegular(context),
        ),
        _isButtonDisabled
            ? Text(
                ' ($_secondsRemaining s)',
                style: CustomTextStyles.font14LightGrayRegular(context),
              ) :
        TextButton(
          onPressed: _resendCode, 
          child: Text(
            'Resend',
            style: CustomTextStyles.font14MainBlueRegular(context),
          )
        )
      ],
    );
  }
  
  void _resendCode() {
    final resendCubit = context.read<ResendOtpCubit>();
    resendCubit.resendOtp();
    _startTimer();
  }
  
  void _startTimer() {
    setState(() => _isButtonDisabled = true);
    _secondsRemaining = 608679;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
        setState(() => _isButtonDisabled = false);
      }
    });
  }
}