import 'package:medical/features/auth/data/models/user_model.dart';

abstract class LocalDatasource {
  Future<void> saveUserLogin(UserModel user);
  UserModel? getUserData();
}
