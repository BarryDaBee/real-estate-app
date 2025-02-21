import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class AppBlurredIconButton extends StatelessWidget {
  const AppBlurredIconButton({
    required this.icon,
    super.key,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CircleAvatar(
        radius: 20.radius,
        backgroundColor: AppColors.primary.white.withValues(alpha: 0.3),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1,
            sigmaY: 1,
          ),
          child: icon,
        ),
      ),
    );
  }
}
