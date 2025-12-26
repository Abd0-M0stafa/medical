import 'package:flutter/material.dart';
import 'package:medical/features/alerts/presentation/view/widgets/alerts_badge_icon.dart';
import 'package:medical/features/home/presentation/view/widgets/patient_status_header.dart';
import 'package:medical/features/home/presentation/view/widgets/vitals_section.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(height: 60, child: Image.asset('assets/images/logo.png')),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            PatientStatusHeader(),
            SizedBox(height: 16),
            Expanded(child: VitalsSection()),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
