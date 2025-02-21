import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class RentOffers extends StatelessWidget {
  const RentOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      width: 155.radius,
      height: 155.radius,
      decoration: BoxDecoration(
        color: AppColors.primary.lightBrown,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.height),
          Text(
            l10n.rent,
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppColors.primary.brown,
              // fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '2 212',
            style: context.textTheme.displaySmall?.copyWith(
              color: AppColors.primary.brown,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            l10n.offers,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.primary.brown,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
