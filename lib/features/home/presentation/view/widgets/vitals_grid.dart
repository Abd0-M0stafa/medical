import 'package:flutter/material.dart';
import 'vital_card.dart';

class VitalsGrid extends StatelessWidget {
  const VitalsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: const [
        VitalCard(title: 'Oxygen', value: '98%', range: '95–100'),
        VitalCard(title: 'Heart Rate', value: '72 bpm', range: '60–100'),
        VitalCard(title: 'Temperature', value: '36.8°C', range: '36.1–37.2'),
      ],
    );
  }
}
