import 'package:costworks/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../constants/color_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late VideoPlayerController _controller;
  final PageController _pageController = PageController();
  int _currentindex = 0;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(VideoAssets.onBoardingBackground)
      ..initialize().then((_) {
        setState(() {});
        _controller
          ..setLooping(true)
          ..setVolume(0)
          ..play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
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
                  AppColors.red.withOpacity(0.5),
                  AppColors.primaryColor.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// TEXT UI
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
            child: Column(
              children: [
                Image.asset(PngAssets.logo, height: 45.h),
                Spacer(),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentindex = index;
                      });
                    },

                    children: [
                      Column(
                        children: [
                          Text(
                            "Optimize Your Utility Bills and Save More",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Let us analyze your utility bills and find the best deals to help you save more.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Easy Bill Upload & Info Capture",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Capture or upload your bill (PDF or photo) and enter your details manually or via business card capture.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 80.h),
                ElevatedButton(
                  onPressed: () {
                    _pageController.animateTo(
                      _currentindex + 1,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(_currentindex == 0 ? "Continue" : "Get Started"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
