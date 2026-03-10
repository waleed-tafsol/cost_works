import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:video_player/video_player.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../utils/custom_fonts.dart';
import '../widgets/app_gradient_button.dart';
import '../widgets/sheets/add_card_screen_sheet.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late VideoPlayerController _controller;
  final _pageController = PageController();
  final _viewNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(VideoAssets.onBoardingBackground)
      ..initialize().then((_) {
        setState(() {});
        if (kDebugMode) {
          return;
        }
        _controller
          ..setLooping(true)
          ..setVolume(0)
          ..play();
      });
  }

  void _changePage(int? currentPage) {
    if (currentPage == 1) {
      _viewNotifier.value = true;
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void _onContinue() {
    AddCardScreenSheet.show(context: context);
  }

  @override
  void dispose() {
    _controller.dispose();
    _viewNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// VIDEO BACKGROUND
          if (_controller.value.isInitialized)
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),

          /// GRADIENT OVERLAY
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.red.withValues(alpha: 0.4),
                  AppColors.darkPrimaryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// TEXT UI
          Positioned(
            top: 48.h,
            bottom: 40.h,
            left: 24.w,
            right: 24.w,
            child: Column(
              children: [
                Hero(
                  tag: 'logo_white',
                  child: SvgPicture.asset(
                    SvgAssets.logoWhite,
                    width: 85.w,
                    height: 48.h,
                  ),
                ),
                const Spacer(),
                AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  child: ValueListenableBuilder(
                    valueListenable: _viewNotifier,
                    builder: (context, showLogin, _) {
                      if (showLogin) {
                        return _buildLoginWithView();
                      }
                      return _buildOnboardingView();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildOnboardingView() {
    return SizedBox(
      height: 320.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [_buildOnboardingInfo1(), _buildOnboardingInfo2()],
            ),
          ),
          ListenableBuilder(
            listenable: _pageController,
            builder: (context, _) {
              final currentPage = _pageController.page?.toInt();
              return ElevatedButton(
                onPressed: () => _changePage(currentPage),
                child: Text(currentPage == 0 ? 'Get Started' : 'Continue'),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingInfo1() {
    return Column(
      children: [
        Text(
          'Optimize Your Utility Bills and Save More',
          textAlign: TextAlign.center,
          style: CustomFonts.white32w600,
        ),
        SizedBox(height: 16.h),
        Text(
          'Let us analyze your utility bills and find the best deals to help you save more.',
          textAlign: TextAlign.center,
          style: CustomFonts.white14w400,
        ),
      ],
    );
  }

  Widget _buildOnboardingInfo2() {
    return Column(
      children: [
        Text(
          'Easy Bill Upload & Info Capture',
          textAlign: TextAlign.center,
          style: CustomFonts.white32w600,
        ),
        SizedBox(height: 16.h),
        Text(
          'Capture or upload your bill (PDF or photo) and enter your details manually or via business card capture.',
          textAlign: TextAlign.center,
          style: CustomFonts.white14w400,
        ),
      ],
    );
  }

  Widget _buildLoginWithView() {
    return Column(
      children: [
        Text(
          'Personalized Insights & Reports',
          style: CustomFonts.white32w600,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          'Get personalized savings insights, ROI, and detailed reports on your utility costs and potential savings.',
          style: CustomFonts.white14w400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        AppGradientButton(label: 'Continue With Email', onTap: _onContinue),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Text('Or', style: CustomFonts.white14w400),
        ),
        ElevatedButton.icon(
          onPressed: _onContinue,
          icon: Icon(TablerIcons.brand_google, size: 24.sp),
          label: Text('Continue with Google', style: CustomFonts.black14w400),
        ),
        SizedBox(height: 24.h),
        ElevatedButton.icon(
          onPressed: _onContinue,
          icon: Icon(TablerIcons.brand_apple, size: 24.sp),
          label: Text('Continue with Apple', style: CustomFonts.black14w400),
        ),
        SizedBox(height: 24.h),
        RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: CustomFonts.white14w400,
            children: [
              TextSpan(
                text: 'Login',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: CustomFonts.white14w400.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
