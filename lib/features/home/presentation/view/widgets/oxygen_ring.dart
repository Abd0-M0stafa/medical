import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/features/home/presentation/view/widgets/oxygen_painter.dart';
import 'package:medical/features/home/presentation/view_model/fetch_patient_info/fetch_patient_info_cubit.dart';

class OxygenRing extends StatelessWidget {
  const OxygenRing({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: OxygenPainter(percentage: 0.98),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${context.read<FetchPatientInfoCubit>().patientInfoModel!.oxygen}%',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B5CFF),
                ),
              ),
              Text('SpO₂', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
