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
        children: [
          Text(
            'Heart Rate',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 29),
              SizedBox(
                height: 50,
                child: Image.asset("assets/images/heart_rate.png"),
              ),
              SizedBox(width: 50),
              Text(
                '75 bpm',
                style: TextStyle(
                  fontSize: 25,
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
            style: TextStyle(color: const Color.fromARGB(255, 131, 131, 131)),
          ),
        ],
      ),
    );
  }
}
