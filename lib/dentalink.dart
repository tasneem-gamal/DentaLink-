import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/routing/app_router.dart';
import 'package:dentalink/core/routing/routes.dart';
import 'package:dentalink/features/home/logic/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Dentalink extends StatelessWidget {
  const Dentalink({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'DentaLink',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white
        ),
        themeMode: themeProvider.themeMode,
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: Constants.isLoggedIn ? Routes.homeView : Routes.onBoardingView,
        onGenerateRoute: appRouter.generateRoutes,
      )
    );
  }
}