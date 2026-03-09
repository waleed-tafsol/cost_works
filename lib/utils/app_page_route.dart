import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppPageRoute extends MaterialPageRoute {
  AppPageRoute({required super.builder, super.settings});

  @override
  Duration get transitionDuration =>
      const Duration(milliseconds: kDebugMode ? 1000 : 300);
}
