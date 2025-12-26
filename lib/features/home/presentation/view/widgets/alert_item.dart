import 'package:flutter/material.dart';

class AlertItem extends StatelessWidget {
  const AlertItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Colors.red.shade50,
      leading: const Icon(Icons.favorite, color: Colors.red),
      title: const Text('Abnormal Heart Rate Detected'),
      subtitle: const Text('6:30 PM'),
      trailing: const Icon(Icons.check_circle_outline),
    );
  }
}
