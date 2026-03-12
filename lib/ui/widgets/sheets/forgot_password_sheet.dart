import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../utils/custom_fonts.dart';
import '../app_gradient_text.dart';
import 'otp_sheet.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet._();

  static Future<void> show({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const ForgotPasswordSheet._(),
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
            const Center(child: AppGradientText('Forgot password')),
            SizedBox(height: 8.h),
            Text(
              'Enter your email for the verification process. We will send 4 digits code to your email.',
              style: CustomFonts.grey14w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),

            Text("Email Address", style: CustomFonts.black14w400),
            SizedBox(height: 10.h),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Email Address",
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                OtpSheet.show(context: context);
              },
              style: ElevatedButton.styleFrom(
                textStyle: CustomFonts.white14w500,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.white,
              ),
              child: const Text("Send Code"),
            ),
          ],
        ),
      ),
    );
  }
}
