import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_colors.dart';

class AlertsBadgeIcon extends StatelessWidget {
  final bool hasUnread;

  const AlertsBadgeIcon({super.key, required this.hasUnread});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        if (hasUnread)
          Positioned(
            right: 10,
            top: 10,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.criticalRed,
            ),
          ),
      ],
    );
  }
}
