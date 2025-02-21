import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_animated_user_avatar.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/buy_offers.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/property_card.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/rent_offers.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/localizations_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.1),
            const Color(0xFFd87705).withValues(alpha: .7),
          ],
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: kToolbarHeight + 8),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.radius),
                      decoration: BoxDecoration(
                        color: AppColors.primary.white,
                        borderRadius: BorderRadius.circular(8.radius),
                      ),
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
                            'Saint Petersburg',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.primary.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const AppAnimatedUserAvatar(),
                  ],
                ),
                SizedBox(height: 36.height),
                Text(
                  l10n.hi('Marina'),
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.primary.brown,
                  ),
                ),
                SizedBox(height: 4.height),
                Text(
                  l10n.letsSelectYourPerfectPlace,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary.black,
                  ),
                ),
                SizedBox(height: 16.height),
                const Row(
                  children: [
                    BuyOffers(),
                    Spacer(),
                    RentOffers(),
                  ],
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.5,
            snap: true,
            builder: (_, scrollController) {
              return Container(
                padding: EdgeInsets.only(
                  left: 8.radius,
                  top: 8.radius,
                  right: 8.radius,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView(
                  padding: EdgeInsets.only(bottom: 100.height),
                  controller: scrollController,
                  children: [
                    PropertyCard(
                      textAlignment: Alignment.center,
                      backgroundImage:
                          AppAssets.images.png.dummyProperty0.provider(),
                      address: 'Gladkova St., 25',
                    ),
                    SizedBox(height: 8.radius),
                    SizedBox(
                      height: 360.height,
                      child: Row(
                        children: [
                          Expanded(
                            child: PropertyCard(
                              address: 'Gubina St., 11',
                              backgroundImage: AppAssets
                                  .images.png.dummyProperty2
                                  .provider(),
                            ),
                          ),
                          SizedBox(width: 8.radius),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: PropertyCard(
                                    address: 'Trefoleva St., 11',
                                    backgroundImage: AppAssets
                                        .images.png.dummyProperty1
                                        .provider(),
                                  ),
                                ),
                                SizedBox(height: 8.radius),
                                Expanded(
                                  child: PropertyCard(
                                    address: 'Sedova St., 22',
                                    backgroundImage: AppAssets
                                        .images.png.dummyProperty2
                                        .provider(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.radius),
                    SizedBox(
                      height: 360.height,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: PropertyCard(
                                    address: 'Moniepoint St., 1',
                                    backgroundImage: AppAssets
                                        .images.png.dummyProperty0
                                        .provider(),
                                  ),
                                ),
                                SizedBox(height: 8.radius),
                                Expanded(
                                  child: PropertyCard(
                                    address: 'HireMe St., 2',
                                    backgroundImage: AppAssets
                                        .images.png.dummyProperty2
                                        .provider(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.radius),
                          Expanded(
                            child: PropertyCard(
                              address: 'Remote St., 3',
                              backgroundImage: AppAssets
                                  .images.png.dummyProperty1
                                  .provider(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
