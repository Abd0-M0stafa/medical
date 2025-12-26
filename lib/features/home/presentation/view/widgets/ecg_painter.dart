import 'package:flutter/material.dart';

class EcgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(20, size.height / 2)
      ..lineTo(30, 10)
      ..lineTo(40, size.height - 10)
      ..lineTo(55, size.height / 2)
      ..lineTo(80, size.height / 2)
      ..lineTo(95, 15)
      ..lineTo(110, size.height - 15)
      ..lineTo(130, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
