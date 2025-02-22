import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class ListOfVariantsButton extends StatelessWidget {
  const ListOfVariantsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ClipRRect(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.radius,
          vertical: 10.radius,
        ),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: AppColors.primary.white.withValues(alpha: 0.3),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1,
            sigmaY: 1,
          ),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.text_justify,
                color: AppColors.primary.white,
              ),
              SizedBox(width: 8.width),
              Text(
                l10n.listOfVariants,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
