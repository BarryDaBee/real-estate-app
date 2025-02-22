import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_animated_caption.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_animated_greeting.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_animated_user_avatar.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/buy_offers.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/location_chip.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/property_card.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/rent_offers.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Row(
                  children: [
                    LocationChip(
                      location: 'Saint Petersburg',
                    ),
                    Spacer(),
                    AppAnimatedUserAvatar(),
                  ],
                ),
                SizedBox(height: 36.height),
                const AppAnimatedGreeting(
                  delay: AnimationConstants.normalDuration,
                ),
                SizedBox(height: 4.height),
                const AppAnimatedCaption(
                  delay: AnimationConstants.normalDuration,
                ),
                const Row(
                  children: [
                    BuyOffers(
                      delay: AnimationConstants.longDuration,
                    ),
                    Spacer(),
                    RentOffers(
                      delay: AnimationConstants.longDuration,
                      count: 2212,
                    ),
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
