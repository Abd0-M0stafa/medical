import 'package:medical/core/errors/faliure.dart';
import 'package:medical/features/home/presentation/data/models/patient_info_model.dart';

abstract class FetchPatientInfo {}

class FetchPatientInfoInitial extends FetchPatientInfo {}

class FetchPatientInfoLoading extends FetchPatientInfo {}

class FetchPatientInfoSuccess extends FetchPatientInfo {
  final PatientInfoModel patientInfoModel;

  FetchPatientInfoSuccess(this.patientInfoModel);
}

class FetchPatientInfoFailure extends FetchPatientInfo {
  final Failure failure;

  FetchPatientInfoFailure(this.failure);
}
