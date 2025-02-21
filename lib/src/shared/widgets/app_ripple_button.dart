import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:real_estate_app/src/shared/theme/app_colors.dart';

class AppRippleButton extends HookWidget {
  const AppRippleButton({
    required this.child,
    required this.onTap,
    super.key,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tapPosition = useState<Offset?>(null);
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 600),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          tapPosition.value = null; // Remove ripple after fade-out
        }
      });

    final animation = useAnimation(
      TweenSequence([
        TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1), weight: 0.5),
        TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0), weight: 0.5),
      ]).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
      ),
    );

    void startRipple(TapUpDetails details) {
      tapPosition.value = details.localPosition;
      controller.forward(from: 0);
      onTap();
    }

    return GestureDetector(
      onTapUp: startRipple,
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          if (tapPosition.value != null)
            Positioned.fill(
              child: CustomPaint(
                painter: _RipplePainter(tapPosition.value, animation),
              ),
            ),
        ],
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  _RipplePainter(this.tapPosition, this.progress);

  final Offset? tapPosition;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    if (tapPosition == null) return;

    final maxRadius = size.longestSide * 0.5;
    final double innerRadius = max(12, maxRadius * (1 - progress));
    final outerRadius = progress * (maxRadius + 5);

    final innerPaint = Paint()
      ..color = AppColors.primary.white.withValues(alpha: min(0.7, progress))
      ..strokeWidth = innerRadius / 1.5
      ..style = PaintingStyle.stroke;

    final outerPaint = Paint()
      ..color = AppColors.primary.white.withValues(alpha: 1 - progress)
      ..strokeWidth = 4 * progress
      ..style = PaintingStyle.stroke;

    canvas
      ..drawCircle(tapPosition!, outerRadius, outerPaint)
      ..drawCircle(tapPosition!, innerRadius, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
