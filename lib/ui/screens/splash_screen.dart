import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../constants/route_generator.dart';
import '../../utils/custom_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animate = false;
  bool _animateText = false;
  static const _duration = Duration(milliseconds: kDebugMode ? 1000 : 300);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(_duration);
      setState(() {
        _animate = true;
      });
      await Future.delayed(_duration);
      setState(() {
        _animateText = true;
      });
      await Future.delayed(_duration + Durations.long1);
      Navigator.pushNamed(context, onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              SvgAssets.logo,
              width: 210.w,
              height: 120.h,
            ),
          ),
          Center(
            child: UnconstrainedBox(
              clipBehavior: Clip.antiAlias,
              child: AnimatedContainer(
                width: _animate ? 2.5.sw : 0,
                height: _animate ? 2.5.sh : 0,
                alignment: Alignment.center,
                duration: _duration,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.red, AppColors.primaryColor],
                    ),
                  ),
                  child: _buildFrontItems(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrontItems() {
    log('ANIMATING');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.w),
      child: GestureDetector(
        onTap: () {
          if (kDebugMode) {
            Navigator.pushNamed(context, onboardingScreen);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo_white',
              child: SvgPicture.asset(
                SvgAssets.logoWhite,
                width: 210.w,
                height: 120.h,
              ),
            ),
            SizedBox(height: 30.h),
            AnimatedSize(
              duration: _duration,
              alignment: Alignment.bottomCenter,
              curve: Curves.easeIn,
              child: SizedBox(
                height: _animateText ? 130.h : 0,
                child: Column(
                  children: [
                    Text('CostWorks', style: CustomFonts.white45w700),
                    SizedBox(height: 12.h),
                    Text(
                      'Helping your business maximize profits, productivity & minimize expenses',
                      textAlign: TextAlign.center,
                      style: CustomFonts.white9w400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
