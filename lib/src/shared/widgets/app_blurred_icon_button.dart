import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';
import 'package:real_estate_app/src/shared/widgets/app_ripple_button.dart';

class AppBlurredIconButton extends StatelessWidget {
  const AppBlurredIconButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppRippleButton(
      onTap: onTap,
      child: ClipOval(
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
      ),
    );
  }
}
