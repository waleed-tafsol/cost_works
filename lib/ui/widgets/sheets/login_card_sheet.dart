import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../utils/custom_fonts.dart';
import '../app_gradient_text.dart';
import 'forgot_password_sheet.dart';

class LoginCardSheet extends StatelessWidget {
  const LoginCardSheet._();

  static Future<void> show({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const LoginCardSheet._(),
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
            const Center(child: AppGradientText('Welcome Back!')),
            SizedBox(height: 8.h),
            Text(
              'Sign in to access your utility savings, compare bills, and start saving today.',
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
            SizedBox(height: 16.h),
            Text("Password", style: CustomFonts.black14w400),
            SizedBox(height: 10.h),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_outlined, size: 16.sp),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                ForgotPasswordSheet.show(context: context);
              },
              child: Text(
                "Forgot Password?",
                style: CustomFonts.black14w400.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                textStyle: CustomFonts.white14w500,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.white,
              ),
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
