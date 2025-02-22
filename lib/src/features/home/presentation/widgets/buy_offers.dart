import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class BuyOffers extends HookWidget {
  const BuyOffers({
    required this.delay,
    this.count = 1034,
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
      child: CircleAvatar(
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
              NumberFormat().format(counterAnimation).replaceAll(',', ' '),
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
      ),
    );
  }
}
