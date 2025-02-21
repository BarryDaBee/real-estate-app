import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/gen/fonts.gen.dart';
import 'package:real_estate_app/src/app/app_router/app_router.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';
import 'package:real_estate_app/src/shared/widgets/unfocus.dart';

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
      child: Unfocus(
        child: MaterialApp.router(
          title: 'Real Estate App',
          routerConfig: routerConfig,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('en'), // English
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary.orange),
            useMaterial3: true,
            fontFamily: FontFamily.euclidCircularA,
          ),
        ),
      ),
    );
  }
}
