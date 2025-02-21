import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/responsive_sizer_extension.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    required this.backgroundImage,
    super.key,
  });
  final ImageProvider backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180.height,
      constraints: BoxConstraints(
        minHeight: 180.height,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
