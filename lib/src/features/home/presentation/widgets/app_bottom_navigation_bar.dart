import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_bottom_bar_item.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class AppBottomNavigationBar extends HookWidget {
  const AppBottomNavigationBar({
    required this.activeIndex,
    required this.onTap,
    super.key,
  });

  final int activeIndex;
  final ValueChanged<int> onTap;

  bool _isActive(int index) => activeIndex == index;

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: AnimationConstants.shortDuration);

    final yPosition = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    useEffect(
      () {
        Future.delayed(const Duration(milliseconds: 5500), controller.forward);
        return controller.dispose;
      },
      [],
    );

    return Transform.translate(
      offset: Offset(0, 100.height * (1 - yPosition)),
      child: Container(
        margin: EdgeInsets.only(
          left: 60.width,
          right: 60.width,
          bottom: 24.radius,
        ),
        height: 56.height,
        decoration: ShapeDecoration(
          color: AppColors.gray.gray2A,
          shape: const StadiumBorder(),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.width),
          child: Row(
            children: [
              AppBottomBarItem(
                title: 'Search',
                isActive: _isActive(0),
                icon: AppAssets.images.svg.search.svg(width: 13.radius),
                onTap: () => onTap(0),
              ),
              AppBottomBarItem(
                title: 'Messaging',
                icon: AppAssets.images.svg.message.svg(width: 13.radius),
                isActive: _isActive(1),
                onTap: () => onTap(1),
              ),
              AppBottomBarItem(
                title: 'Home',
                icon: AppAssets.images.svg.home.svg(width: 18.radius),
                isActive: _isActive(2),
                onTap: () => onTap(2),
              ),
              AppBottomBarItem(
                title: 'Favorites',
                icon: Icon(
                  CupertinoIcons.heart_fill,
                  color: AppColors.primary.white,
                ),
                isActive: _isActive(3),
                onTap: () => onTap(3),
              ),
              AppBottomBarItem(
                title: 'Profile',
                icon: AppAssets.images.svg.person.svg(width: 13.radius),
                isActive: _isActive(4),
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
