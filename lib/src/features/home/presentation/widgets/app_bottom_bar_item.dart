import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';
import 'package:real_estate_app/src/shared/widgets/app_ripple_button.dart';

class AppBottomBarItem extends StatelessWidget {
  const AppBottomBarItem({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isActive,
    super.key,
  });

  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final bool isActive;

  double? get _side => isActive ? 56.radius : 36.radius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppRippleButton(
        onTap: onTap,
        child: Tooltip(
          message: title,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            height: _side,
            width: _side,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color:
                  isActive ? AppColors.primary.orange : AppColors.gray.gray22,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: icon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
