import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/src/shared/extensions/app_theme_extension.dart';

@RoutePage()
class EmptyPage extends StatelessWidget {
  const EmptyPage({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: context.textTheme.displayMedium,
      ),
    );
  }
}
