import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/core/networking/dio_service.dart';
import 'package:medical/features/home/presentation/data/data_sources/home_api_datasource.dart';
import 'package:medical/features/home/presentation/data/repositories/home_repository.dart';
import 'package:medical/features/home/presentation/view/widgets/logout_dialog.dart';
import 'package:medical/features/home/presentation/view/widgets/patient_status_header.dart';
import 'package:medical/features/home/presentation/view/widgets/vitals_section.dart';
import 'package:medical/features/home/presentation/view_model/fetch_patient_info/fetch_patient_info_cubit.dart';
import 'package:medical/features/home/presentation/view_model/fetch_patient_info/fetch_patient_info_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchPatientInfoCubit(
        HomeRepository(
          homeRemoteDataSource: HomeApiDatasource(DioService(Dio())),
        ),
      )..startFetching(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 246, 246),
        body: Builder(
          builder: (context) {
            return BlocConsumer<FetchPatientInfoCubit, FetchPatientInfo>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is FetchPatientInfoSuccess) {
                  return Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              child: Image.asset('assets/images/logo.png'),
                            ),

                            Spacer(),
                            IconButton(
                              color: Colors.red,

                              onPressed: () => showLogoutDialog(context),
                              icon: Icon(Icons.logout_outlined),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        PatientStatusHeader(),
                        SizedBox(height: 16),
                        Expanded(child: VitalsSection()),
                        SizedBox(height: 12),
                      ],
                    ),
                  );
                } else if (state is FetchPatientInfoFailure) {
                  return Center(child: Text(state.failure.errMessage));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ),
      ),
    );
  }
}

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const LogoutDialog(),
  );
}
