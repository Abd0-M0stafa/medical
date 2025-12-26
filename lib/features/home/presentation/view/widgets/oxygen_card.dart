import 'package:flutter/material.dart';
import 'package:medical/features/home/presentation/view/widgets/oxygen_ring.dart';
import 'package:medical/features/home/presentation/view/widgets/vital_card_container.dart';

class OxygenCard extends StatelessWidget {
  const OxygenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return VitalCardContainer(
      shadowColor: const Color(0xFF0B5CFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Oxygen Level', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.water_drop, size: 42, color: Color(0xFF0B5CFF)),
              OxygenRing(),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Normal Range: 95% - 100%',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
