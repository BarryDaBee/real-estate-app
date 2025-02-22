import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/features/home/presentation/widgets/property_card.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/custom_hooks/draggable_scrollable_controller.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';

class PropertiesSheet extends HookWidget {
  const PropertiesSheet({
    required this.delay,
    super.key,
  });

  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final draggableScrollableController = useDraggableScrollableController();

    useEffect(
      () {
        Future.delayed(
          delay,
          () {
            draggableScrollableController.animateTo(
              0.7,
              duration: AnimationConstants.shortDuration,
              curve: Curves.decelerate,
            );
          },
        );
        return null;
      },
      [],
    );

    return DraggableScrollableSheet(
      minChildSize: 0.2,
      initialChildSize: 0.2,
      controller: draggableScrollableController,
      builder: (_, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            left: 6.radius,
            top: 6.radius,
            right: 6.radius,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: ListView(
            padding: EdgeInsets.only(bottom: 100.height),
            controller: scrollController,
            children: [
              PropertyCard(
                textAlignment: Alignment.center,
                backgroundImage: AppAssets.images.png.dummyProperty0.provider(),
                address: 'Gladkova St., 25',
                delay: const Duration(
                  milliseconds: 5000,
                ),
              ),
              SizedBox(height: 8.radius),
              SizedBox(
                height: 360.height,
                child: Row(
                  children: [
                    Expanded(
                      child: PropertyCard(
                        address: 'Gubina St., 11',
                        delay: const Duration(
                          milliseconds: 5000,
                        ),
                        backgroundImage:
                            AppAssets.images.png.dummyProperty2.provider(),
                      ),
                    ),
                    SizedBox(width: 8.radius),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: PropertyCard(
                              address: 'Trefoleva St., 11',
                              delay: const Duration(
                                milliseconds: 5000,
                              ),
                              backgroundImage: AppAssets
                                  .images.png.dummyProperty1
                                  .provider(),
                            ),
                          ),
                          SizedBox(height: 8.radius),
                          Expanded(
                            child: PropertyCard(
                              address: 'Sedova St., 22',
                              delay: const Duration(
                                milliseconds: 5000,
                              ),
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
                              delay: const Duration(
                                milliseconds: 5000,
                              ),
                              backgroundImage: AppAssets
                                  .images.png.dummyProperty0
                                  .provider(),
                            ),
                          ),
                          SizedBox(height: 8.radius),
                          Expanded(
                            child: PropertyCard(
                              address: 'HireMe St., 2',
                              delay: const Duration(
                                milliseconds: 5000,
                              ),
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
                        delay: const Duration(
                          milliseconds: 5000,
                        ),
                        backgroundImage:
                            AppAssets.images.png.dummyProperty1.provider(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
