import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical/core/errors/faliure.dart';
import 'package:medical/core/errors/firebase_failure.dart';
import 'package:medical/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:medical/features/auth/data/data_sources/local_datasource/local_datasource.dart';
import 'package:medical/features/auth/data/models/login_request_model.dart';
import 'package:medical/features/auth/data/models/register_user_request_model.dart';
import 'package:medical/features/auth/data/models/user_model.dart';

class AuthRepoImpl {
  final AuthRemoteDataSource authRemoteDataSource;
  final LocalDatasource localDatasource;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.localDatasource,
  });

  Future<Either<Failure, UserModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      var result = await authRemoteDataSource.login(loginRequestModel);
      await localDatasource.saveUserLogin(result);
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuthException(e));
    }
  }

  Future<Either<Failure, UserModel>> register(
    RegisterUserRequestModel registerUserRequestModel,
  ) async {
    try {
      var result = await authRemoteDataSource.register(
        registerUserRequestModel,
      );
      await localDatasource.saveUserLogin(result);
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuthException(e));
    }
  }
}
