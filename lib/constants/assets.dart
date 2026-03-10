// ignore_for_file: camel_case_types

abstract final class PngAssets {
  static const String _assets = 'assets/png/';
  //splah logo
  static const String logo = '${_assets}logo.png';
  // on boarding images
  // static const String logo = '${_assets}logo.png';
}

abstract final class DummyAssets {
  // static const String _assets = 'assets/dummy/';
  // static const String person = '${_assets}person.png';
}

abstract final class VideoAssets {
  static const String _assets = 'assets/video/';

  static const String onBoardingBackground =
      '${_assets}onboarding_background.mp4';
}

abstract final class SvgAssets {
  static const String _assets = 'assets/svg/';
  static const String logo = '${_assets}logo.svg';
  static const String logoWhite = '${_assets}logo_white.svg';
  static const String businessCard = '${_assets}business_card.svg';
}
