import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class AppAnimatedCaption extends HookWidget {
  const AppAnimatedCaption({
    required this.delay,
    super.key,
  });

  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: AnimationConstants.normalDuration,
    );

    useEffect(
      () {
        Future.delayed(
          delay,
          controller.forward,
        );
        return controller.dispose;
      },
      [],
    );

    final firstTextHeightFactor = useAnimation(
      Tween<double>(
        begin: 0,
        end: 1,
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

    final secondTextHeightFactor = useAnimation(
      Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.2,
            1,
            curve: Curves.easeIn,
          ),
        ),
      ),
    );

    final l10n = context.l10n;
    return Transform.translate(
      offset: Offset(0, 50.height * (1 - controller.value)),
      child: SizedBox(
        height: 80.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: firstTextHeightFactor,
                child: Text(
                  l10n.letsSelectYour,
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: AppColors.primary.black,
                  ),
                ),
              ),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: secondTextHeightFactor,
                child: Text(
                  l10n.perfectPlace,
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: AppColors.primary.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
