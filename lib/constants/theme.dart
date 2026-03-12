import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/custom_fonts.dart';
import 'color_constants.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.light,
      ),
    ).copyWith(
      brightness: Brightness.light,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          // Set the predictive back transitions for Android.
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        },
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      // primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        // centerTitle: true,
      ),

      // Text Selection Theme for cursor color
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primaryColor, // Cursor color
      ),

      iconTheme: const IconThemeData(color: Colors.black54),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        side: BorderSide.none,
      ),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        checkColor: const WidgetStatePropertyAll(Colors.white),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }
          return null;
        }),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.h),
          textStyle: TextStyle(
            height: 0,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          foregroundColor: AppColors.primaryColor,
          side: const BorderSide(color: AppColors.primaryColor),
          // padding: EdgeInsets.symmetric(vertical: 19.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity, 48.h),
          minimumSize: Size(double.infinity, 50.h),
          textStyle: TextStyle(
            height: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.textFieldFillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        errorStyle: TextStyle(fontSize: 11.sp, overflow: TextOverflow.visible),
        errorMaxLines: 2,
        suffixIconColor: AppColors.iconColor,

        hintStyle: CustomFonts.grey14w400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        dragHandleColor: const Color(0xffCDCFD0),
        modalBarrierColor: Colors.transparent,
        backgroundColor: Colors.white,
        dragHandleSize: Size(48.w, 5.h),
        constraints: BoxConstraints(minHeight: 0.789.sh, maxHeight: 0.789.sh),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue[400],
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          // Set the predictive back transitions for Android.
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        },
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[400],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
