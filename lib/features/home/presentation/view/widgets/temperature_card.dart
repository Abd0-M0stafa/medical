import 'package:flutter/material.dart';
import 'package:medical/features/home/presentation/view/widgets/tempreture_bar.dart';
import 'package:medical/features/home/presentation/view/widgets/vital_card_container.dart';

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return VitalCardContainer(
      shadowColor: const Color(0xFF4A90E2), // لون بارد خفيف
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Temperature',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            '36.8°C',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B5CFF),
            ),
          ),
          SizedBox(height: 14),
          TemperatureBar(value: 36.8, min: 36.5, max: 37.5),
          SizedBox(height: 12),
          Text(
            'Normal Range: 36.5° - 37.5°',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
