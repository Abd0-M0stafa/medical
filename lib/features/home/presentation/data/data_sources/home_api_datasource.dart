import 'package:medical/core/networking/api_service.dart';
import 'package:medical/core/networking/api_urls.dart';
import 'package:medical/features/home/presentation/data/data_sources/home_remote_data_source.dart';
import 'package:medical/features/home/presentation/data/models/patient_info_model.dart';

class HomeApiDatasource extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeApiDatasource(this.apiService);
  @override
  Future<PatientInfoModel> fetchPatientInfo() async {
    var result = await apiService.get(url: ApiUrls.patientInfo);

    return PatientInfoModel.fromJson(result);
  }
}
