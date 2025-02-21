import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';
import 'package:real_estate_app/src/shared/widgets/app_blurred_icon_button.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Expanded(
                    child: TextFormField(
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
                    ),
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
              Align(
                alignment: Alignment.centerLeft,
                child: AppBlurredIconButton(
                  icon: Icon(
                    CupertinoIcons.square_stack_3d_up,
                    color: Colors.white,
                    size: 16.radius,
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
                  ),
                  const Spacer(),
                  ClipRRect(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.radius,
                        vertical: 10.radius,
                      ),
                      decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: AppColors.primary.white.withValues(alpha: 0.3),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1,
                          sigmaY: 1,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.text_justify,
                              color: AppColors.primary.white,
                            ),
                            SizedBox(width: 8.width),
                            Text(
                              'List of variants',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.primary.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.height),
            ],
          ),
        ),
      ),
    );
  }
}
