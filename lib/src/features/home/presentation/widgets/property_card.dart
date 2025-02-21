import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    required this.backgroundImage,
    required this.address,
    this.textAlignment = Alignment.centerLeft,
    super.key,
  });
  final ImageProvider backgroundImage;
  final Alignment textAlignment;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.radius),
      constraints: BoxConstraints(
        minHeight: 190.height,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: textAlignment,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.radius),
            child: Container(
              padding: EdgeInsets.all(2.radius),
              height: 40.height,
              width: double.maxFinite,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: AppColors.primary.white.withValues(alpha: 0.5),
              ),
              alignment: Alignment.centerRight,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
                child: Container(
                  width: 36.radius,
                  height: 36.radius,
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    shadows: [
                      BoxShadow(
                        color: AppColors.primary.black.withValues(alpha: 0.15),
                        offset: Offset(0, 4),
                        blurRadius: 12,
                      ),
                    ],
                    color: AppColors.primary.white,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 16.radius,
                    color: AppColors.primary.brown,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: switch (textAlignment) {
              (Alignment.centerLeft) => 8.width,
              (_) => null,
            },
            child: Text(
              address,
              style: context.textTheme.bodyMedium?.copyWith(
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
