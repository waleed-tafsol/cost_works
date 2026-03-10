import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/route_generator.dart';
import 'constants/theme.dart';
import 'main.dart';
import 'utils/screen_size.dart';

class AppInit extends StatelessWidget {
  AppInit({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // final ThemeMode themeMode = context.watch()<ThemeViewModel>().themeMode;
    return ScreenUtilInit(
      designSize: getDesignSize(context: context),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        configLoading();
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'CostWorks',
          initialRoute: splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
          // home: WalletTransactionScreen(),
          // themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
