import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class SearchChip extends HookWidget {
  const SearchChip({
    required this.showIcon,
    super.key,
  });

  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: AnimationConstants.shortDuration,
    );
    useEffect(
      () {
        Future.delayed(
          const Duration(milliseconds: 500),
          controller.forward,
        );
        return controller.dispose;
      },
      [],
    );
    final scale = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    return Transform.scale(
      scale: scale,
      origin: Offset(-30.radius, 30.radius),
      child: AnimatedContainer(
        height: 40.height,
        width: showIcon ? 40.radius : 82.radius,
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: 12.radius,
          vertical: 12.radius,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.orange,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: showIcon
            ? Icon(
                CupertinoIcons.building_2_fill,
                color: AppColors.primary.white,
              )
            : Text(
                '13.3 mn P',
                maxLines: 1,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary.white,
                ),
              ),
      ),
    );
  }
}
