import 'package:flutter/material.dart';
import 'package:medical/features/home/presentation/view/widgets/hart_rate_card.dart';
import 'package:medical/features/home/presentation/view/widgets/oxygen_card.dart';
import 'package:medical/features/home/presentation/view/widgets/temperature_card.dart';

class VitalsSection extends StatelessWidget {
  const VitalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        OxygenCard(),
        SizedBox(height: 16),
        HeartRateCard(),
        SizedBox(height: 16),
        TemperatureCard(),
      ],
    );
  }
}
