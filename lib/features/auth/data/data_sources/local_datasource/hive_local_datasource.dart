import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical/core/utils/hive_box_keys.dart';
import 'package:medical/core/utils/user_keys.dart';
import 'package:medical/features/auth/data/data_sources/local_datasource/local_datasource.dart';
import 'package:medical/features/auth/data/models/user_model.dart';

class HiveLocalDatasource extends LocalDatasource {
  Box<UserModel> get _box => Hive.box<UserModel>(HiveBoxKeys.user);

  @override
  Future<void> saveUserLogin(UserModel user) async {
    await _box.put(UserKeys.loggedUser, user);
  }

  @override
  UserModel? getUserData() {
    return _box.get(UserKeys.loggedUser);
  }
}
