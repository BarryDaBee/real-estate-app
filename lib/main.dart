import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/src/app/app_router/app_router.dart';

void main() {
  final appRouter = AppRouter();
  runApp(RealEstateApp(routerConfig: appRouter.config()));
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key, required this.routerConfig});
  final RouterConfig<UrlState> routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Real Estate App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
