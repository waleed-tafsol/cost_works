import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';

class _OnboardingModel {
  final String title;
  final String description;
  final String image;

  _OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final GlobalKey<FormState> personalFormKey = GlobalKey<FormState>();

  final List<_OnboardingModel> _onboardingList = [
    // _OnboardingModel(
    //   title: 'Track Your Rides',
    //   description:
    //       'Easily track your trips and view ride history in one place.',
    //   image: PngAssets.onboarding1,
    // ),
    // _OnboardingModel(
    //   title: 'Earn on the Go',
    //   description: 'Accept rides quickly and earn money with every trip.',
    //   image: PngAssets.onboarding2,
    // ),
    // _OnboardingModel(
    //   title: 'Fast & Secure',
    //   description: 'Enjoy a fast, secure, and reliable experience every time.',
    //   image: PngAssets.onboarding3,
    // ),
  ];
  final PageController _pageController = PageController();
  final ValueNotifier _currentPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: PageView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          _currentPage.value = index;
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(_onboardingList[index].image),
              SizedBox(height: 60.h),
              Text(
                _onboardingList[index].title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                child: Text(
                  _onboardingList[index].description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 24.h),
              ValueListenableBuilder(
                valueListenable: _currentPage,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_onboardingList.length, (index) {
                      final bool isSelected = index == _currentPage.value;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 24.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.kPrimaryColor
                              : AppColors.textFieldFillColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                child: ValueListenableBuilder(
                  valueListenable: _currentPage,
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_currentPage.value < 2) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Navigator.pushReplacementNamed(context, loginScreen);
                        }
                      },
                      child: Text(
                        _currentPage.value < 2 ? 'Next' : 'Get Started',
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
