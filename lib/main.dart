import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/gen/fonts.gen.dart';
import 'package:real_estate_app/src/app/app_router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();

  runApp(RealEstateApp(routerConfig: appRouter.config()));
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({required this.routerConfig, super.key});

  final RouterConfig<UrlState> routerConfig;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        title: 'Real Estate App',
        routerConfig: routerConfig,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: FontFamily.euclidCircularA,
        ),
      ),
    );
  }
}
