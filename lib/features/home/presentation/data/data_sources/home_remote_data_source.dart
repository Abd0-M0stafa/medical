import 'package:medical/features/home/presentation/data/models/patient_info_model.dart';

abstract class HomeRemoteDataSource {
  Future<PatientInfoModel> fetchPatientInfo();
}
