import 'package:hive/hive.dart';
import 'package:medical/core/utils/hive_box_keys.dart';
import 'package:medical/core/utils/user_keys.dart';
import 'package:medical/features/auth/data/models/user_model.dart';

class GetUserData {
  GetUserData._();

  static final instance = GetUserData._();
  UserModel? userModel;
  void getUserDataInit() {
    Box<UserModel> box = Hive.box<UserModel>(HiveBoxKeys.user);
    userModel = box.get(UserKeys.loggedUser);
  }

  Future<void> deleteUserData() async {
    Box<UserModel> box = Hive.box<UserModel>(HiveBoxKeys.user);
    await box.delete(UserKeys.loggedUser);
    userModel = null;
  }
}
