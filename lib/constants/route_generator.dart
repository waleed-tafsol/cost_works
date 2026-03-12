import 'package:flutter/material.dart';

import '../ui/screens/onboarding_screen.dart';
import '../ui/screens/password_changed_success_screen.dart';
import '../ui/screens/qr_scanner_screen.dart';
import '../ui/screens/splash_screen.dart';
import '../utils/app_page_route.dart';

const String splashScreen = '/';
const String onboardingScreen = '/onboarding_Screen';
const String addCardScreen = '/add_card_screen';
const String qrScannerScreen = '/qr_scanner_screen';
const String passwordChangeScreen = '/reset_password_screen';

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
      case passwordChangeScreen:
        return AppPageRoute(
          settings: const RouteSettings(name: passwordChangeScreen),
          builder: (_) => const PasswordChangedSuccessScreen(),
        );
          case qrScannerScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: qrScannerScreen),
          builder: (_) => const QrScannerScreen(),
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
