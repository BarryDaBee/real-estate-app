import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/src/app/app_router/app_router.gr.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_bottom_navigation_bar.dart';

@RoutePage()
class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      routes: [
        const SearchRoute(),
        EmptyRoute(message: 'Messaging'),
        const HomeRoute(),
        EmptyRoute(message: 'Favorites'),
        EmptyRoute(message: 'Profile'),
      ],
      extendBody: true,
      bottomNavigationBuilder: (_, tabsRouter) {
        return AppBottomNavigationBar(
          activeIndex: tabsRouter.activeIndex,
          onTap: (int index) {
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}
