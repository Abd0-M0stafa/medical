import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_colors.dart';

class AlertTile extends StatelessWidget {
  final String title;
  final String time;
  final bool isCritical;

  const AlertTile({
    super.key,
    required this.title,
    required this.time,
    this.isCritical = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.warning,
        color: isCritical ? AppColors.criticalRed : Colors.grey,
      ),
      title: Text(title),
      subtitle: Text(time),
    );
  }
}
