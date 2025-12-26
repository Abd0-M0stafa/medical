import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medical/core/errors/faliure.dart';
import 'package:medical/core/errors/server_failure.dart';
import 'package:medical/features/home/presentation/data/data_sources/home_remote_data_source.dart';
import 'package:medical/features/home/presentation/data/models/patient_info_model.dart';

class HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepository({required this.homeRemoteDataSource});
  Future<Either<Failure, PatientInfoModel>> fetchPatientInfo() async {
    try {
      var result = await homeRemoteDataSource.fetchPatientInfo();
      return Right(result);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
