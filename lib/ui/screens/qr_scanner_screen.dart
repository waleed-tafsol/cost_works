import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../constants/color_constants.dart';
import '../../utils/custom_fonts.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double scanHeight = 161.h;

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(onDetect: (barcode) {}),

          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Color(0xAA0F2439),
              BlendMode.srcOut,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: .circular(20),
                ),
                width: double.infinity,
                height: scanHeight,
                child: const DottedBorder(
                  options: RectDottedBorderOptions(
                    color: Colors.white,

                    strokeWidth: 4,
                    dashPattern: [22, 10],
                  ),
                  child: SizedBox(),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                SizedBox(width: double.infinity, height: scanHeight),

                const Spacer(),
                Text(
                  "Capture your Business Card",
                  style: CustomFonts.white24w400,
                ),
                SizedBox(height: 39.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.w,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2.w),
                    ),
                    padding: EdgeInsets.all(1.w),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.white,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
