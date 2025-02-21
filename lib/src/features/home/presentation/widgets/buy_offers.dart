import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class BuyOffers extends StatelessWidget {
  const BuyOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CircleAvatar(
      radius: 80.radius,
      backgroundColor: AppColors.primary.orange,
      child: Column(
        children: [
          SizedBox(height: 12.height),
          Text(
            l10n.buy,
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppColors.primary.white,
              // fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '1 034',
            style: context.textTheme.displaySmall?.copyWith(
              color: AppColors.primary.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            l10n.offers,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.primary.white,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
