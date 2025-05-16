import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pixelfield_flutter/app_utils/app_colors.dart';

class WavyBackground extends StatefulWidget {
  final Widget child;

  const WavyBackground({super.key, required this.child});

  @override
  State<WavyBackground> createState() => _WavyBackgroundState();
}

class _WavyBackgroundState extends State<WavyBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: WavyPainter(_animation.value),
              child: const SizedBox.expand(),
            );
          },
        ),
        Positioned.fill(child: widget.child),
      ],
    );
  }
}

class WavyPainter extends CustomPainter {
  final double wavePhase;
  final Random _random = Random();

  WavyPainter(this.wavePhase);

  @override
  void paint(Canvas canvas, Size size) {
    final baseColor = AppColors.inputText;
    final waveColor = AppColors.primaryColor.withOpacity(0.3);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = baseColor,
    );

    final paint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;

    const double waveGap = 5.5;
    const double waveAmplitude = 100.0;
    const double frequency = 0.5;

    for (double offsetX = 0; offsetX < size.width; offsetX += waveGap) {
      final path = Path();

      // Random vertical phase offset to avoid sync
      final verticalOffset = sin(offsetX / 80 + wavePhase) * 30;

      for (double y = 0; y <= size.height; y += 8) {
        double x = sin((y / size.height * 2 * pi * frequency) + wavePhase + offsetX / 30) *
            waveAmplitude +
            sin((y + offsetX) * 0.03 + wavePhase) * 10 +
            cos((y / 40) + offsetX / 100) * 6 + // irregular shape
            offsetX;

        if (y == 0) {
          path.moveTo(x, y + verticalOffset);
        } else {
          path.lineTo(x, y + verticalOffset);
        }
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WavyPainter oldDelegate) {
    return oldDelegate.wavePhase != wavePhase;
  }
}
