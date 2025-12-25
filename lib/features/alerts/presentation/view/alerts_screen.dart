import 'package:flutter/material.dart';
import 'package:medical/features/alerts/presentation/view/widgets/alert_tile.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts')),
      body: ListView(
        children: const [
          AlertTile(
            title: 'Emergency SOS Activated',
            time: 'Today · 10:42 AM',
            isCritical: true,
          ),
          AlertTile(
            title: 'Patient removed the watch',
            time: 'Yesterday · 8:15 PM',
          ),
        ],
      ),
    );
  }
}
