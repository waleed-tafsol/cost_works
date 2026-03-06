import 'package:flutter/material.dart';

import '../ui/screen/splash_screen.dart';

const String splashScreen = '/';
// const String onboardingScreen = '/onboarding_Screen';
// const String loginScreen = '/login_Screen';
// const String signUpScreen = '/sign_up_screen';
// const String forgotPasswordScreen = '/forgot_password_screen';
// const String otpScreen = '/otp_screen';
// const String resetPasswordScreen = '/reset_password_screen';
// const String stayUpdatedScreen = '/stay_updated_screen';
// const String deliveryAddressScreen = '/delivery_address_screen';
// const String bottomNavBarScreen = '/bottom_nav_page';
// const String orderDetailScreen = '/order_detail_screen';
// const String changePasswordScreen = '/change_password_screen';
// const String editProfileScreen = '/edit_profile_screen';
// const String orderHistoryScreen = '/order_history_screen';
// const String bookingPostalCodeScreen = '/booking_postal_code_screen';
// const String bookingPickDateScreen = '/booking_pick_date_screen';
// const String bookingConfirmScreen = '/booking_confirmed_screen';
// const String notificationScreen = '/notification_screen';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: splashScreen),
          builder: (_) => SplashScreen(),
        );
      // case onboardingScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: onboardingScreen),
      //     builder: (_) => OnboardingScreen(),
      //   );
      // case loginScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: loginScreen),
      //     builder: (_) => LoginScreen(),
      //   );
      // case signUpScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: signUpScreen),
      //     builder: (_) => SignUpScreen(),
      //   );
      // case forgotPasswordScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: forgotPasswordScreen),
      //     builder: (_) => const ForgotPasswordScreen(),
      //   );
      // case otpScreen:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => OtpScreen(
      //       resetPasswordReq: settings.arguments as ResetPasswordRequestModel,
      //     ),
      //   );
      // case resetPasswordScreen:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => ResetPasswordScreen(
      //       resetPasswordReq: settings.arguments as ResetPasswordRequestModel,
      //     ),
      //   );
      // case stayUpdatedScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: stayUpdatedScreen),
      //     builder: (_) => const StayUpdatedScreen(),
      //   );
      // case deliveryAddressScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: deliveryAddressScreen),
      //     builder: (_) => DeliveryAddressScreen(),
      //   );
      // case bottomNavBarScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: bottomNavBarScreen),
      //     builder: (_) => const BottomNavBarScreen(),
      //   );
      // case orderDetailScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: orderDetailScreen),
      //     builder: (_) => const OrderDetailScreen(),
      //   );
      // case changePasswordScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: changePasswordScreen),
      //     builder: (_) => const ChangePasswordScreen(),
      //   );
      // case editProfileScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: editProfileScreen),
      //     builder: (_) => const EditProfileScreen(),
      //   );
      // case orderHistoryScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: orderHistoryScreen),
      //     builder: (_) => const OrderHistoryScreen(),
      //   );
      // case bookingPostalCodeScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: bookingPostalCodeScreen),
      //     builder: (_) => const BookingPostalCodeScreen(),
      //   );
      // case bookingPickDateScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: bookingPickDateScreen),
      //     builder: (_) => const BookingPickDateScreen(),
      //   );
      // case bookingConfirmScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: bookingConfirmScreen),
      //     builder: (_) => const BookingConfirmScreen(),
      //   );
      // case notificationScreen:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(name: notificationScreen),
      //     builder: (_) => const NotificationScreen(),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('ERROR')),
        );
      },
    );
  }
}
