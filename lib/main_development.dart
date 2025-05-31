import 'package:dentalink/core/di/dependency_injection.dart';
import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/core/routing/app_router.dart';
import 'package:dentalink/dentalink.dart';
import 'package:dentalink/features/home/logic/theme_provider/theme_provider.dart';
import 'package:dentalink/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await checkIfLoggedInUser();
  setUpGetIt();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      builder:(context, index) => Dentalink(appRouter: AppRouter(),)
    )
  );
}

checkIfLoggedInUser() async{
  String? userToken = await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken);
  if(userToken != null && userToken.isNotEmpty){
    Constants.isLoggedIn = true;
  } else {
    Constants.isLoggedIn = false;
  }
}