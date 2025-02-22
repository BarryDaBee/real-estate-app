import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/app_search_text_field.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/list_of_variants_button.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/search_pop_up_menu.dart';
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
                Duration(milliseconds: 300),
                () {
                  overlayManager.removeAllOverlays();
                },
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: AppSearchTextField(),
                    ),
                    SizedBox(width: 16.width),
                    CircleAvatar(
                      radius: 23.radius,
                      backgroundColor: AppColors.primary.white,
                      child: AppAssets.images.svg.filter.svg(
                        width: 16.radius,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CompositedTransformTarget(
                  link: layerLink,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppBlurredIconButton(
                      onTap: showMenu,
                      icon: Icon(
                        CupertinoIcons.square_stack_3d_up,
                        color: Colors.white,
                        size: 16.radius,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.height),
                Row(
                  children: [
                    AppBlurredIconButton(
                      icon: AppAssets.images.svg.locationArrow.svg(
                        width: 16.radius,
                      ),
                      onTap: () {},
                    ),
                    const Spacer(),
                    const ListOfVariantsButton(),
                  ],
                ),
                SizedBox(height: 16.height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum LocationPinTypes {
  cosyAreas('Cosy areas'),
  price('Price'),
  infrastructure('Infrastructure'),
  withoutAnyLayer('Without any layer');

  final String label;
  const LocationPinTypes(this.label);

  Widget get icon => switch (this) {
        (LocationPinTypes.cosyAreas) => Icon(
            CupertinoIcons.checkmark_shield,
            size: 14.radius,
          ),
        LocationPinTypes.price => AppAssets.images.svg.wallet.svg(
            width: 14.radius,
            colorFilter: ColorFilter.mode(
              AppColors.gray.gray2A,
              BlendMode.srcIn,
            ),
          ),
        LocationPinTypes.infrastructure =>
          AppAssets.images.svg.infrastructure.svg(
            width: 14.radius,
            colorFilter: ColorFilter.mode(
              AppColors.gray.gray2A,
              BlendMode.srcIn,
            ),
          ),
        LocationPinTypes.withoutAnyLayer => Icon(
            CupertinoIcons.square_stack_3d_up,
            color: AppColors.gray.gray2A,
            size: 14.radius,
          ),
      };
}
