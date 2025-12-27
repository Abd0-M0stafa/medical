import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/features/home/presentation/data/models/patient_info_model.dart';
import 'package:medical/features/home/presentation/data/repositories/home_repository.dart';
import 'package:medical/features/home/presentation/view_model/fetch_patient_info/fetch_patient_info_states.dart';
import 'dart:async';

class FetchPatientInfoCubit extends Cubit<FetchPatientInfo> {
  FetchPatientInfoCubit(this.homeRepository) : super(FetchPatientInfoInitial());

  final HomeRepository homeRepository;

  PatientInfoModel? patientInfoModel;
  Timer? _timer;

  bool _isFirstFetch = true;

  /// Start polling
  void startFetching() {
    fetchPatientInfo();

    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => fetchPatientInfo(),
    );
  }

  Future<void> fetchPatientInfo() async {
    if (_isFirstFetch) {
      emit(FetchPatientInfoLoading());
    }

    final result = await homeRepository.fetchPatientInfo();

    result.fold(
      (l) {
        emit(FetchPatientInfoFailure(l));
      },
      (r) {
        patientInfoModel = r;
        emit(FetchPatientInfoSuccess(r));
      },
    );

    _isFirstFetch = false;
  }

  void stopFetching() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
