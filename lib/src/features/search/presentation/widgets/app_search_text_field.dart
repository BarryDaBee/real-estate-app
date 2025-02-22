import 'package:flutter/material.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColors.primary.white,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.images.svg.searchOutlined.svg(
              width: 18.radius,
            ),
          ],
        ),
        hintText: 'Saint Petersburg',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.radius),
        ),
      ),
    );
  }
}
