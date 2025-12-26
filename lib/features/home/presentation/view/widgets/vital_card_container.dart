import 'package:flutter/material.dart';

class VitalCardContainer extends StatelessWidget {
  final Widget child;
  final Color shadowColor;

  const VitalCardContainer({
    super.key,
    required this.child,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Stack(
        children: [
          // Card background
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Color(0xFFFDFDFD)),
            child: child,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      shadowColor.withOpacity(0.0),
                      shadowColor.withOpacity(0.18),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
