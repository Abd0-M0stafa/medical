import 'package:flutter/material.dart';
import 'package:medical/features/alerts/presentation/view/widgets/alerts_badge_icon.dart';
import 'package:medical/features/home/presentation/view/widgets/patient_status_header.dart';
import 'package:medical/features/home/presentation/view/widgets/vitals_grid.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Patient Overview'),
        actions: const [AlertsBadgeIcon(hasUnread: true)],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            PatientStatusHeader(),
            SizedBox(height: 24),
            Expanded(child: VitalsGrid()),
          ],
        ),
      ),
    );
  }
}
