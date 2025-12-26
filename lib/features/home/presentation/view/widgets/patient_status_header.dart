import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_styles.dart';

class PatientStatusHeader extends StatelessWidget {
  const PatientStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Patient Status: Stable', style: AppTextStyles.title),
            Row(
              children: [
                Icon(Icons.circle, color: Colors.green, size: 10),
                SizedBox(width: 6),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text('Last Reading: Just Now', style: AppTextStyles.subtitle),
      ],
    );
  }
}
