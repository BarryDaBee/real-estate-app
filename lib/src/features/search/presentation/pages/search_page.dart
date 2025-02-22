import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/gen/assets.gen.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/app_search_text_field.dart';
import 'package:real_estate_app/src/features/search/presentation/widgets/list_of_variants_button.dart';
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
                  const ListOfVariantsButton(),
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
