import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/app_search_text_field.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/list_of_variants_button.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/search_chip.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/search_pop_up_menu.dart';
import 'package:real_estate_app/src/shared/constants/animation_constants.dart';
import 'package:real_estate_app/src/shared/enums/location_pin_types.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';
import 'package:real_estate_app/src/shared/utils/overlay_manager.dart';
import 'package:real_estate_app/src/shared/widgets/app_blurred_icon_button.dart';

@RoutePage()
class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final overlayManager = useMemoized(OverlayManager.new);
    final layerLink = useMemoized(LayerLink.new);

    final selectedPinType = useState(LocationPinTypes.withoutAnyLayer);

    final controller = useAnimationController(
      duration: AnimationConstants.normalDuration,
    );

    final showSearchIcon = useState(false);

    useEffect(
      () {
        controller.forward();
        return controller.dispose;
      },
      [],
    );

    final scale = useAnimation(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    Future<void> showMenu() async {
      final overlayState = Overlay.of(context);
      final overlayEntry = OverlayEntry(
        builder: (_) {
          return SearchPopUpMenu(
            layerLink: layerLink,
            value: selectedPinType.value,
            onChanged: (LocationPinTypes value) {
              selectedPinType.value = value;
              Future.delayed(
                const Duration(milliseconds: 300),
                overlayManager.removeAllOverlays,
              );
            },
          );
        },
      );
      overlayManager.addOverlay(overlayState, overlayEntry);
    }

    return Listener(
      onPointerDown: (_) {
        overlayManager.removeAllOverlays();
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppAssets.images.png.map.provider(),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 90.radius,
                top: 150.radius,
                child: SearchChip(
                  showIcon: showSearchIcon.value,
                ),
              ),
              Positioned(
                left: 80.radius,
                top: 100.radius,
                child: SearchChip(
                  showIcon: showSearchIcon.value,
                ),
              ),
              Positioned(
                right: 24.radius,
                top: 180.radius,
                child: SearchChip(
                  showIcon: showSearchIcon.value,
                ),
              ),
              Positioned(
                right: 24.radius,
                top: 340.radius,
                child: SearchChip(
                  showIcon: showSearchIcon.value,
                ),
              ),
              Positioned(
                right: 64.radius,
                top: 420.radius,
                child: SearchChip(
                  showIcon: showSearchIcon.value,
                ),
              ),
              Positioned(
                left: 64.radius,
                top: 450.radius,
                child: SearchChip(
                  showIcon: showSearchIcon.value,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.width),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Transform.scale(
                            scale: scale,
                            child: const AppSearchTextField(),
                          ),
                        ),
                        SizedBox(width: 16.width),
                        Transform.scale(
                          scale: scale,
                          child: CircleAvatar(
                            radius: 23.radius,
                            backgroundColor: AppColors.primary.white,
                            child: AppAssets.images.svg.filter.svg(
                              width: 16.radius,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CompositedTransformTarget(
                      link: layerLink,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Transform.scale(
                          scale: scale,
                          child: AppBlurredIconButton(
                            onTap: () {
                              showMenu();
                              showSearchIcon.value = !showSearchIcon.value;
                            },
                            icon: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                AppColors.primary.white,
                                BlendMode.srcIn,
                              ),
                              child: selectedPinType.value.icon,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.height),
                    Row(
                      children: [
                        Transform.scale(
                          scale: scale,
                          child: AppBlurredIconButton(
                            icon: AppAssets.images.svg.locationArrow.svg(
                              width: 16.radius,
                            ),
                            onTap: () {},
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: scale,
                          child: const ListOfVariantsButton(),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.height),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
