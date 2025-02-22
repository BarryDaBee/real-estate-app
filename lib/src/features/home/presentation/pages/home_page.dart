import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_animated_caption.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_animated_greeting.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/app_animated_user_avatar.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/buy_offers.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/location_chip.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/properties_sheet.dart';
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
                SizedBox(height: 8.height),
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
                SizedBox(height: 8.height),
              ],
            ),
          ),
          const PropertiesSheet(
            delay: Duration(milliseconds: 4800),
          ),
        ],
      ),
    );
  }
}
