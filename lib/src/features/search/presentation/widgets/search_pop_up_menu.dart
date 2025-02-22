import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/src/shared/enums/location_pin_types.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';
import 'package:real_estate_app/src/shared/widgets/app_ripple_button.dart';

class SearchPopUpMenu extends HookWidget {
  const SearchPopUpMenu({
    required this.onChanged,
    required this.layerLink,
    required this.value,
    super.key,
  });

  final LayerLink layerLink;
  final ValueChanged<LocationPinTypes> onChanged;
  final LocationPinTypes value;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    useEffect(
      () {
        controller.forward();
        return controller.dispose;
      },
      [],
    );

    return Positioned(
      width: 130.radius,
      child: CompositedTransformFollower(
        link: layerLink,
        offset: Offset(0, -110.radius),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.scale(
              scale: controller.value,
              origin: Offset(-60.radius, 80.radius),
              child: child,
            );
          },
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 14.radius,
                horizontal: 12.radius,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.whiteFC,
                borderRadius: BorderRadius.circular(16.radius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: LocationPinTypes.values
                    .map(
                      (pinType) => AppRippleButton(
                        rippleColor: const Color(0xFFD3D3D3),
                        onTap: () {
                          controller.reverse().then((_) {
                            onChanged(pinType);
                          });
                        },
                        child: _Tile(
                          icon: pinType.icon,
                          label: pinType.label,
                          isActive: value == pinType,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.icon,
    required this.label,
    required this.isActive,
  });
  final Widget icon;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.radius),
      child: Row(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.primary.orange : AppColors.gray.gray2A,
              BlendMode.srcIn,
            ),
            child: icon,
          ),
          SizedBox(width: 6.width),
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color:
                  isActive ? AppColors.primary.orange : AppColors.gray.gray2A,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
