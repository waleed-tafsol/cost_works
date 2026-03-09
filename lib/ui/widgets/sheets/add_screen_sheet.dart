import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/color_constants.dart';
import '../../../utils/custom_fonts.dart';
import '../app_gradient_button.dart';

class AddScreenSheet extends StatelessWidget {
  const AddScreenSheet._();

  static Future<void> show({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return const AddScreenSheet._();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 40.h),
            ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                colors: [Color(0xFFCA0013), AppColors.primaryColor],
              ).createShader(rect),
              child: Text('Welcome!', style: CustomFonts.white24w600),
            ),
            SizedBox(height: 8.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Capture or upload your ',
                style: CustomFonts.black14w400,
                children: [
                  TextSpan(
                    text: 'Business Card ',
                    style: CustomFonts.black14w600,
                  ),
                  TextSpan(
                    text: 'or enter your personal details manually.',
                    style: CustomFonts.black14w400,
                  ),
                ],
              ),
            ),
            Expanded(
              child: AvatarGlow(
                glowColor: AppColors.secondaryColor,
                glowCount: 3,
                child: SvgPicture.asset(SvgAssets.businessCard),
              ),
            ),
            const AppGradientButton(label: 'Capture Business Card'),
            SizedBox(height: 12.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.borderColor,
              ),
              onPressed: () {},
              child: const Text('Enter Details Manually'),
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 20.h),
          ],
        ),
      ),
    );
  }
}
