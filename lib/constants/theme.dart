import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_constants.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.kPrimaryColor,
        brightness: Brightness.light,
      ),
    ).copyWith(
      brightness: Brightness.light,

      // primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.blackColor,
        titleTextStyle: TextStyle(
          color: AppColors.blackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),

        elevation: 0,
        // centerTitle: true,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 25.sp,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 16.sp,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        displayLarge: TextStyle(
          fontSize: 15.sp,
          color: AppColors.textGreyColor,

          fontWeight: FontWeight.w400,
        ),

        bodyMedium: TextStyle(
          fontSize: 15.sp,
          color: AppColors.blackColor,

          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 13.sp,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      // Text Selection Theme for cursor color
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.kPrimaryColor, // Cursor color
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
        checkColor: WidgetStatePropertyAll(Colors.white),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kPrimaryColor;
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
          foregroundColor: AppColors.kPrimaryColor,
          side: BorderSide(color: AppColors.kPrimaryColor),
          // padding: EdgeInsets.symmetric(vertical: 19.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.h),
          textStyle: TextStyle(
            height: 0,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: Colors.white,
          // padding: EdgeInsets.symmetric(vertical: 19.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
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
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        errorStyle: TextStyle(fontSize: 11.sp, overflow: TextOverflow.visible),
        errorMaxLines: 2,
        suffixIconColor: AppColors.textGreyColor,

        hintStyle: TextStyle(
          height: 0,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.textFieldFillColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.textFieldFillColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.textFieldFillColor),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        dragHandleColor: Color(0xffCDCFD0),
        backgroundColor: Colors.white,
        dragHandleSize: Size(48.w, 5.h),
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
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      iconTheme: const IconThemeData(color: AppColors.blackColor),
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
