import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../constants/color_constants.dart';
import '../../utils/custom_fonts.dart';

class AppGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const AppGradientButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onTap ?? () {},
        child: Ink(
          height: 48.h + 3.r,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: GradientBoxBorder(
              width: 3.r,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.32, 0.68, 1],
                colors: [
                  Color(0xFFF32222),
                  Color(0xFFFF67AA),
                  Color(0xFFFF67AA),
                  AppColors.primaryColor,
                ],
              ),
            ),
          ),
          child: Center(child: Text(label, style: CustomFonts.black14w500)),
        ),
      ),
    );
  }
}
