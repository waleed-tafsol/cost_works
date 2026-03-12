import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../../utils/custom_fonts.dart';
import '../widgets/app_gradient_text.dart';

class PasswordChangedSuccessScreen extends StatelessWidget {
  const PasswordChangedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            const Spacer(),
            Image.asset(PngAssets.gradientCheck, height: 120.w, width: 120.w),
            SizedBox(height: 24.w),
            const Center(child: AppGradientText('Password Changed!')),
            SizedBox(height: 8.h),
            Text(
              'Now you can use your new password to login to your account.',
              style: CustomFonts.grey14w400,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
