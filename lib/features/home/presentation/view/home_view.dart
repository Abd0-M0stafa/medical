import 'package:flutter/material.dart';
import 'package:medical/features/home/presentation/view/widgets/logout_dialog.dart';
import 'package:medical/features/home/presentation/view/widgets/patient_status_header.dart';
import 'package:medical/features/home/presentation/view/widgets/vitals_section.dart';

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
            Row(
              children: [
                SizedBox(
                  height: 60,
                  child: Image.asset('assets/images/logo.png'),
                ),

                Spacer(),
                IconButton(
                  color: Colors.red,

                  onPressed: () => showLogoutDialog(context),
                  icon: Icon(Icons.logout_outlined),
                ),
              ],
            ),
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

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const LogoutDialog(),
  );
}
