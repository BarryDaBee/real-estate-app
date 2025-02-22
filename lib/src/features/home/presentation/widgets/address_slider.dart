import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class AddressSlider extends HookWidget {
  const AddressSlider({
    required this.textAlignment,
    required this.address,
    required this.delay,
    super.key,
  });

  final Alignment textAlignment;
  final String address;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: AnimationConstants.normalDuration,
    );

    final widthAnimation = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    final textOpacity = useAnimation(
      Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.5,
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
        return controller.dispose;
      },
      [],
    );
    return Stack(
      alignment: textAlignment,
      children: [
        LayoutBuilder(
          builder: (_, constraints) {
            final maxWidth = constraints.maxWidth;
            return Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(16.radius),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.radius),
                  child: Container(
                    padding: EdgeInsets.all(2.radius),
                    height: 42.height,
                    width: widthAnimation * maxWidth,
                    decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      color: AppColors.primary.white.withValues(alpha: 0.5),
                    ),
                    alignment: Alignment.centerRight,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                      child: Container(
                        width: 36.radius,
                        height: 36.radius,
                        decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          shadows: [
                            BoxShadow(
                              color: AppColors.primary.black
                                  .withValues(alpha: 0.15),
                              offset: const Offset(0, 4),
                              blurRadius: 12,
                            ),
                          ],
                          color: AppColors.primary.white,
                        ),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          size: 14.radius,
                          color: AppColors.primary.brown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: switch (textAlignment) {
            (Alignment.bottomLeft) => 24.width,
            (_) => null,
          },
          bottom: switch (textAlignment) {
            (Alignment.bottomLeft) => 27.height,
            (_) => null,
          },
          child: Text(
            address,
            style: context.textTheme.bodyMedium?.copyWith(
              letterSpacing: 0,
              color: AppColors.primary.black.withValues(alpha: textOpacity),
            ),
          ),
        ),
      ],
    );
  }
}
