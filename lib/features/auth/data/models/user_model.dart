import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String id;

  UserModel({required this.id});

  factory UserModel.fromFirebase(UserCredential user) {
    return UserModel(id: user.user!.uid);
  }
}
