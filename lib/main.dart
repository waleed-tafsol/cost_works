import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_init.dart';
import 'constants/color_constants.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0.h
    ..errorWidget = Icon(Icons.error, color: Colors.red, size: 45.0.sp)
    ..radius = 10.0.r
    ..progressColor = AppColors.primaryColor
    ..backgroundColor = Colors.white
    ..boxShadow = [
      BoxShadow(color: Colors.grey.withValues(alpha: 0.5), blurRadius: 10),
    ]
    ..indicatorColor = AppColors.primaryColor
    ..textColor = AppColors.primaryColor
    ..textStyle = TextStyle(
      color: AppColors.primaryColor,

      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    )
    ..toastPosition = EasyLoadingToastPosition.bottom
    //..maskColor = Colors.white.withValues(alpha: 0.5)
    // ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false
    ..dismissOnTap = false;
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );
  await _initializeFonts();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();
  runApp(AppInit());
}

Future<void> _initializeFonts() async {
  try {
    await GoogleFonts.pendingFonts([GoogleFonts.poppinsTextTheme()]);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
  }
}
