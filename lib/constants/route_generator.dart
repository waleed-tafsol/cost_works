import 'package:flutter/material.dart';

import '../ui/screens/onboarding_screen.dart';
import '../ui/screens/splash_screen.dart';
import '../utils/app_page_route.dart';

const String splashScreen = '/';
const String onboardingScreen = '/onboarding_Screen';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case splashScreen:
        return AppPageRoute(
          settings: const RouteSettings(name: splashScreen),
          builder: (_) => const SplashScreen(),
        );
      case onboardingScreen:
        return AppPageRoute(
          settings: const RouteSettings(name: onboardingScreen),
          builder: (_) => const OnboardingScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return AppPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('ERROR')),
        );
      },
    );
  }
}
