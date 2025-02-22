import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class RentOffers extends HookWidget {
  const RentOffers({
    required this.count,
    required this.delay,
    super.key,
  });

  final Duration delay;
  final int count;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: AnimationConstants.longDuration,
    );

    final scaleAnimation = useAnimation(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.8,
          curve: Curves.ease,
        ),
      ),
    );

    final counterAnimation = useAnimation(
      IntTween(
        begin: 0,
        end: count,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0,
            1,
            curve: Curves.ease,
          ),
        ),
      ),
    );

    useEffect(
      () {
        Future.delayed(
          delay,
          controller.forward,
        );
        return null;
      },
      [],
    );

    final l10n = context.l10n;
    return Transform.scale(
      scale: scaleAnimation,
      origin: Offset(
        0.radius,
        80.radius,
      ),
      child: Container(
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
              NumberFormat().format(counterAnimation).replaceAll(',', ' '),
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
      ),
    );
  }
}
