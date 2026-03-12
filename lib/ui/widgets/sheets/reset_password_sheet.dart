import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/route_generator.dart';
import '../../../utils/custom_fonts.dart';
import '../app_gradient_text.dart';

class ResetPasswordSheet extends StatelessWidget {
  const ResetPasswordSheet._();

  static Future<void> show({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const ResetPasswordSheet._(),
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
            const Center(child: AppGradientText('Reset Password')),
            SizedBox(height: 8.h),
            Text(
              'Set the new password for your account so you can login and access all the features.',
              style: CustomFonts.grey14w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),

            Text("New Password", style: CustomFonts.black14w400),
            SizedBox(height: 10.h),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter New Password"),
            ),
            SizedBox(height: 16.h),
            Text("Confirm Password", style: CustomFonts.black14w400),
            SizedBox(height: 10.h),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Confirm Password",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_outlined, size: 16.sp),
                ),
              ),
            ),
            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, passwordChangeScreen);
              },
              style: ElevatedButton.styleFrom(
                textStyle: CustomFonts.white14w500,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.white,
              ),
              child: const Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
