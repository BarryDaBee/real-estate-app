import 'package:flutter/material.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class LocationChip extends StatefulWidget {
  const LocationChip({
    required this.location,
    super.key,
  });

  final String location;

  @override
  State<LocationChip> createState() => _LocationChipState();
}

class _LocationChipState extends State<LocationChip>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: AnimationConstants.duration,
  );

  late final _widthFactor = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0,
        1,
        curve: Curves.decelerate,
      ),
    ),
  );

  late final _opacity = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.8,
        1,
        curve: Curves.decelerate,
      ),
    ),
  );

  @override
  void initState() {
    _controller
      ..forward()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.radius),
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: _widthFactor.value,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.radius,
            vertical: 8.radius,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.white,
            borderRadius: BorderRadius.circular(8.radius),
          ),
          child: Opacity(
            opacity: _opacity.value,
            child: Row(
              children: [
                AppAssets.images.svg.locationPin.svg(
                  width: 8.radius,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary.brown,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 6.width),
                Text(
                  widget.location,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.primary.brown,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
