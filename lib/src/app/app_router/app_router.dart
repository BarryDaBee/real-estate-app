import 'package:auto_route/auto_route.dart';
import 'package:real_estate_app/src/app/app_router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: BaseRoute.page,
          children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              path: 'search',
              page: SearchRoute.page,
            ),
            AutoRoute(
              path: 'empty',
              page: EmptyRoute.page,
            ),
          ],
        ),
      ];
}
