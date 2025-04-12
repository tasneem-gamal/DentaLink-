import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static EdgeInsets appPadding = EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h);
  static EdgeInsets onBoardingPadding = EdgeInsets.only(left: 24.w, right: 24.w, top: 130.h);

  static bool isLoggedIn = false;
}

class SharedPreferencesKeys{
  static const String userToken = 'userToken';
}