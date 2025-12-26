import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/core/theme/app_styles.dart';
import 'package:medical/features/home/presentation/view_model/fetch_patient_info/fetch_patient_info_cubit.dart';

class PatientStatusHeader extends StatelessWidget {
  const PatientStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wearable Status: ${context.read<FetchPatientInfoCubit>().patientInfoModel!.state == '0' ? 'Not Wearing' : 'Wearing'}',
              style: AppTextStyles.title,
            ),
            Row(
              children: [
                Icon(Icons.circle, color: Colors.green, size: 10),
                SizedBox(width: 6),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text('Last Reading: Just Now', style: AppTextStyles.subtitle),
      ],
    );
  }
}
