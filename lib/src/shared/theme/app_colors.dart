import 'package:flutter/material.dart';

/// A centralized color palette for the application.
///
/// ### Usage:
/// Colors are organized into categories, and each color follows
/// a structured naming convention:
/// - `AppColors.gray.gray2A`
/// - `AppColors.gray.g700`
///
/// ### Naming Convention:
/// - Colors are grouped by type (e.g., `gray`, `error`, `success`).
/// - Each color key consists of:
///   - The color group name.
///   - The first two characters of the hex code or a design-defined variant.
///
/// ### Example:
/// ```dart
/// final backgroundColor = AppColors.gray.gray2A;
/// final borderColor = AppColors.gray.g700;
/// ```
///
/// ### Note:
/// Ideally, colors should be named as specified in the design system.
/// Example:
/// - `AppColors.error.e50`
/// - `AppColors.success.s500`
///
class AppColors {
  const AppColors._();

  static final gray = _Gray();
  static final primary = _Primary();
}

class _Gray {
  _Gray();

  final gray2A = const Color(0xFF2A2A2A);
  final gray22 = const Color(0xFF22221F);
}

class _Primary {
  _Primary();

  final orange = const Color(0xFFFAA00E);
  final white = const Color(0xFFFFFFFF);
}
