import 'dart:developer';

import 'package:flutter/material.dart';

Size getDesignSize({required BuildContext context}) {
  // Get the actual screens size
  final window = View.of(context);
  final size = window.physicalSize / window.devicePixelRatio;
  // Return appropriate design size based on screens width
  if (size.width >= 1200) {
    log('LARGE: ${size.width}');
    return const Size(1200, 1600);
    // Large tablets/Desktop
  } else if (size.width >= 800) {
    log('MEDIUM: ${size.width}');
    return const Size(768, 1024); // Tablets
  } else if (size.width >= 600) {
    log('SMALL: ${size.width}');
    return const Size(600, 900); // Small tablets
  } else {
    log('DEFAULT: ${size.width} ${size.height}');
    return const Size(390, 844);
  }
}
