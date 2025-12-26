import 'package:flutter/material.dart';

class TemperatureBar extends StatelessWidget {
  final double value;
  final double min;
  final double max;

  const TemperatureBar({
    super.key,
    required this.value,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    final percent = ((value - min) / (max - min)).clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final thumbX = width * percent;

        return SizedBox(
          height: 22,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Gradient bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0B5CFF), // بارد
                      Color(0xFFFF4D4D), // سخن
                    ],
                  ),
                ),
              ),

              // White thumb
              Positioned(
                left: thumbX - 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
