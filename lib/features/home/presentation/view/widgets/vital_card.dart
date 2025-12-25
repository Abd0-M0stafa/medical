import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_colors.dart';
import 'package:medical/core/theme/app_styles.dart';

class VitalCard extends StatelessWidget {
  final String title;
  final String value;
  final String range;

  const VitalCard({
    super.key,
    required this.title,
    required this.value,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.subtitle),
          const Spacer(),
          Text(value, style: AppTextStyles.value),
          const SizedBox(height: 6),
          Text('Normal: $range', style: AppTextStyles.subtitle),
        ],
      ),
    );
  }
}
