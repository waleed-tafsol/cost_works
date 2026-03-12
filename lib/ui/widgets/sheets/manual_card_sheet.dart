import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/custom_fonts.dart';
import '../app_gradient_text.dart';

class ManualCardSheet extends StatelessWidget {
  const ManualCardSheet._();

  static Future<void> show({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const ManualCardSheet._(),
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
            const AppGradientText('Enter Your Details'),
            SizedBox(height: 8.h),
            Text(
              'Fill in the following details to help us personalize your experience.',
              style: CustomFonts.grey14w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Text("Full Name", style: CustomFonts.black14w400),
            SizedBox(height: 10.h),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Full Name"),
            ),
          ],
        ),
      ),
    );
  }
}
