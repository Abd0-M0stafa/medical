import 'package:medical/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:medical/features/auth/data/models/login_request_model.dart';
import 'package:medical/features/auth/data/models/register_user_request_model.dart';
import 'package:medical/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRemoteDatasource extends AuthRemoteDataSource {
  @override
  Future<UserModel> login(LoginRequestModel loginRequestModel) async {
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginRequestModel.email,
      password: loginRequestModel.password,
    );
    return UserModel.fromFirebase(result);
  }

  @override
  Future<UserModel> register(
    RegisterUserRequestModel registerRequestModel,
  ) async {
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerRequestModel.email,
      password: registerRequestModel.password,
    );
    return UserModel.fromFirebase(result);
  }
}
