import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class AppAnimatedGreeting extends HookWidget {
  const AppAnimatedGreeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: AnimationConstants.normalDuration);

    final curvedAnimationValue = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    );

    useEffect(
      () {
        Future.delayed(
          const Duration(milliseconds: 1000),
          controller.forward,
        );
        return null;
      },
      [],
    );

    final l10n = context.l10n;

    return Opacity(
      opacity: curvedAnimationValue,
      child: Text(
        l10n.hi('Marina'),
        style: context.textTheme.titleLarge?.copyWith(
          color: AppColors.primary.brown,
        ),
      ),
    );
  }
}
