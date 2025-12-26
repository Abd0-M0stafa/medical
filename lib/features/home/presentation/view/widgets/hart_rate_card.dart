import 'package:flutter/material.dart';
import 'package:medical/features/home/presentation/view/widgets/ecg_line.dart';
import 'package:medical/features/home/presentation/view/widgets/vital_card_container.dart';

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return VitalCardContainer(
      shadowColor: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Heart Rate', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.favorite, color: Colors.red),
              SizedBox(width: 6),
              Text(
                '75 bpm',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          EcgLine(),
          SizedBox(height: 8),
          Text(
            'Normal Range: 60 - 100 bpm',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
