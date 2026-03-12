import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../utils/custom_fonts.dart';
import '../app_gradient_text.dart';
import '../phone_widget.dart';
import 'login_card_sheet.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const Center(child: AppGradientText('Enter Your Details')),
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
              SizedBox(height: 16.h),
              Text("Phone Number", style: CustomFonts.black14w400),
              SizedBox(height: 10.h),
              PhoneWidget(
                phoneController: TextEditingController(),
                isEditable: true,
              ),
              SizedBox(height: 16.h),
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
              SizedBox(height: 16.h),
              Row(
                children: [
                  Checkbox(
                    side: BorderSide(color: AppColors.grey, width: 2.w),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "I agree to the Terms and Conditions",
                    style: CustomFonts.black14w400,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  LoginCardSheet.show(context: context);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: CustomFonts.white14w500,
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                ),
                child: const Text("Let’s Start Saving"),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
