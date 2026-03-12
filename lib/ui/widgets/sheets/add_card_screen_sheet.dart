import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/route_generator.dart';
import '../../../utils/custom_fonts.dart';
import '../app_gradient_button.dart';
import '../app_gradient_text.dart';
import 'manual_card_sheet.dart';

class AddCardScreenSheet extends StatelessWidget {
  const AddCardScreenSheet._();

  static Future<void> show({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return const AddCardScreenSheet._();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            const AppGradientText('Welcome!'),
            SizedBox(height: 8.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Capture or upload your ',
                style: CustomFonts.grey14w400,
                children: [
                  TextSpan(
                    text: 'Business Card ',
                    style: CustomFonts.black14w600,
                  ),
                  TextSpan(
                    text: 'or enter your personal details manually.',
                    style: CustomFonts.grey14w400,
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
            AppGradientButton(
              label: 'Capture Business Card',
              onTap: () {
                Navigator.pushNamed(context, qrScannerScreen);
              },
            ),
            SizedBox(height: 12.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.borderColor,
              ),
              onPressed: () {
                Navigator.pop(context);
                ManualCardSheet.show(context: context);
              },
              child: const Text('Enter Details Manually'),
            ),
          ],
        ),
      ),
    );
  }
}
