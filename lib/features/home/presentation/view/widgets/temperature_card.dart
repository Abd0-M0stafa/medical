import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/features/home/presentation/view/widgets/tempreture_bar.dart';
import 'package:medical/features/home/presentation/view/widgets/vital_card_container.dart';
import 'package:medical/features/home/presentation/view_model/fetch_patient_info/fetch_patient_info_cubit.dart';

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return VitalCardContainer(
      shadowColor: const Color(0xFF4A90E2), // لون بارد خفيف
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Temperature',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 30),
              SizedBox(
                height: 50,
                child: Image.asset("assets/images/temp.png"),
              ),
              SizedBox(width: 50),

              Text(
                '${context.read<FetchPatientInfoCubit>().patientInfoModel!.temp}°C',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B5CFF),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          TemperatureBar(
            value: double.parse(
              context.read<FetchPatientInfoCubit>().patientInfoModel!.temp,
            ),
            min: 36.5,
            max: 37.5,
          ),
          SizedBox(height: 12),
          Text(
            'Normal Range: 36.5° - 37.5°',
            style: TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
          ),
        ],
      ),
    );
  }
}
