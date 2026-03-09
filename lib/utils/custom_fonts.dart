import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

abstract final class CustomFonts {
  static const TextStyle _base = TextStyle(height: 0, color: AppColors.black);

  static TextStyle white12w400 = _base.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static TextStyle white14w500 = _base.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );

  static TextStyle white14w400 = white14w500.copyWith(
    fontWeight: FontWeight.w400,
  );
  static TextStyle white16w600 = white12w400.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle white45w700 = _base.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 45.sp,
  );
  static TextStyle white32w600 = white45w700.copyWith(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle white9w400 = _base.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 9.sp,
  );

  static TextStyle black12w400 = _base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black32w600 = _base.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
  );

  static TextStyle black18w600 = black32w600.copyWith(fontSize: 18.sp);

  static TextStyle black12w500 = _base.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle black14w500 = black12w500.copyWith(fontSize: 14.sp);

  static TextStyle black14w400 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black14w600 = black14w400.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle black16w500 = _base.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static TextStyle black20w500 = _base.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
  );

  static TextStyle white24w600 = white16w600.copyWith(fontSize: 24.sp);

  // static TextStyle grey12w400 = _base.copyWith(
  //   color: AppColors.textGreyColor,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 12.sp,
  // );

  static TextStyle grey14w400 = _base.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
}
