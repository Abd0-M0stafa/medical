import 'package:flutter/material.dart';

class OxygenPainter extends CustomPainter {
  final double percentage;

  OxygenPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    final bgPaint = Paint()
      ..color = const Color(0xFFE6F0FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(center, radius - 5, bgPaint);

    final sweepPaint = Paint()
      ..shader = SweepGradient(
        colors: const [Color(0xFF0B5CFF), Color(0xFF5AA9FF)],
        startAngle: -1.57,
        endAngle: 3.14 * 2 * percentage,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 5),
      -1.57,
      3.14 * 2 * percentage,
      false,
      sweepPaint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
