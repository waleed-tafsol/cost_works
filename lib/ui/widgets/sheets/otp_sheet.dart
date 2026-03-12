import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/color_constants.dart';
import '../../../utils/custom_fonts.dart';
import '../app_gradient_text.dart';
import 'reset_password_sheet.dart';

class OtpSheet extends StatelessWidget {
  const OtpSheet._();

  static Future<void> show({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const OtpSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const Center(child: AppGradientText('Enter 4 Digit Code')),
            SizedBox(height: 8.h),
            Text(
              'Enter 4 digit code that you receive on your email (nicholas.bebjamin@example.com)',
              style: CustomFonts.grey14w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),

            Pinput(
              mainAxisAlignment: MainAxisAlignment.center,
              separatorBuilder: (index) => SizedBox(width: 4.w),
              length: 6,
              defaultPinTheme: PinTheme(
                width: 82.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                textStyle: TextStyle(fontSize: 16.sp),
              ),
              focusedPinTheme: PinTheme(
                width: 82.5.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                textStyle: TextStyle(fontSize: 16.sp),
              ),
              submittedPinTheme: PinTheme(
                width: 82.5.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                textStyle: TextStyle(fontSize: 16.sp),
              ),
              onChanged: (pin) {},
              onCompleted: (pin) {},
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text("Email not received? ", style: CustomFonts.grey14w400),
                Text(
                  "Resend code",
                  style: CustomFonts.black14w400.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ResetPasswordSheet.show(context: context);
              },
              style: ElevatedButton.styleFrom(
                textStyle: CustomFonts.white14w500,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.white,
              ),
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
