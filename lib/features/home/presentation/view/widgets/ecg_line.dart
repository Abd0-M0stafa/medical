import 'package:flutter/material.dart';
import 'package:medical/features/home/presentation/view/widgets/ecg_painter.dart';

class EcgLine extends StatelessWidget {
  const EcgLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: CustomPaint(painter: EcgPainter()),
    );
  }
}
