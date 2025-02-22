import 'package:flutter/cupertino.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

enum LocationPinTypes {
  cosyAreas('Cosy areas'),
  price('Price'),
  infrastructure('Infrastructure'),
  withoutAnyLayer('Without any layer');

  final String label;
  // ignore: sort_constructors_first enums do not follow this rule
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
