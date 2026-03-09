import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../utils/custom_fonts.dart';

class AppGradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const AppGradientText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        colors: [Color(0xFFCA0013), AppColors.primaryColor],
      ).createShader(rect),
      child: Text(text, style: style ?? CustomFonts.white24w600),
    );
  }
}
