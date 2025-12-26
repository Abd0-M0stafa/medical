import 'package:medical/features/auth/data/models/login_request_model.dart';
import 'package:medical/features/auth/data/models/register_user_request_model.dart';
import 'package:medical/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(LoginRequestModel loginRequestModel);
  Future<UserModel> register(RegisterUserRequestModel registerRequestModel);
}
