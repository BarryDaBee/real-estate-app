import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';

class AppAnimatedUserAvatar extends HookWidget {
  const AppAnimatedUserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: AnimationConstants.duration,
    )..forward();

    // Listen to changes on the controller object and rebuild UI
    final curvedAnimation = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    );

    return Transform.scale(
      scale: curvedAnimation,
      // Start animation from bottom left of the avatar
      origin: Offset(0, 32.radius),
      child: CircleAvatar(
        radius: 16.radius,
        backgroundImage: AppAssets.images.png.dummyAvatar.provider(),
      ),
    );
  }
}
