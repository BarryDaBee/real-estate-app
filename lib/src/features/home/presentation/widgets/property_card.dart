import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/address_slider.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';

class PropertyCard extends HookWidget {
  const PropertyCard({
    required this.backgroundImage,
    required this.address,
    required this.delay,
    this.textAlignment = Alignment.bottomLeft,
    super.key,
  });
  final ImageProvider backgroundImage;
  final Alignment textAlignment;
  final String address;
  final Duration delay;

  BorderRadius get _borderRadius => BorderRadius.circular(24);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: AnimationConstants.shortDuration,
    );

    final scale = useAnimation(
      Tween<double>(begin: 1.1, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.ease),
      ),
    );

    useEffect(
      () {
        Future.delayed(
          delay - const Duration(milliseconds: 300),
          controller.forward,
        );
        return null;
      },
      [],
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: _borderRadius,
          child: Transform.scale(
            scale: scale,
            child: Container(
              constraints: BoxConstraints(
                minHeight: 190.height,
              ),
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                image: DecorationImage(
                  image: backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
        ),
        AddressSlider(
          textAlignment: textAlignment,
          address: address,
          delay: delay,
        ),
      ],
    );
  }
}
