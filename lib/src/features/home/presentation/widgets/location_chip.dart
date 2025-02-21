import 'package:flutter/material.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class LocationChip extends StatelessWidget {
  const LocationChip({
    required this.location,
    super.key,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.radius),
      decoration: BoxDecoration(
        color: AppColors.primary.white,
        borderRadius: BorderRadius.circular(8.radius),
      ),
      child: Row(
        children: [
          AppAssets.images.svg.locationPin.svg(
            width: 8.radius,
            colorFilter: ColorFilter.mode(
              AppColors.primary.brown,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 6.width),
          Text(
            location,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.primary.brown,
            ),
          ),
        ],
      ),
    );
  }
}
