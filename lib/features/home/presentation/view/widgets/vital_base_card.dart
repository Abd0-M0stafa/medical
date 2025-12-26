import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_colors.dart';
import 'package:medical/core/theme/app_styles.dart';

class VitalBaseCard extends StatelessWidget {
  final String title;
  final Widget child;
  final String range;

  const VitalBaseCard({
    super.key,
    required this.title,
    required this.child,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.subtitle),
          const SizedBox(height: 12),
          child,
          const SizedBox(height: 12),
          Text(range, style: AppTextStyles.subtitle),
        ],
      ),
    );
  }
}
