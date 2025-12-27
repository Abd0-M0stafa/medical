import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical/core/utils/get_user_data.dart';
import 'package:medical/core/utils/hive_box_keys.dart';
import 'package:medical/features/auth/data/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical/features/splash/presentation/view/splah_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(HiveBoxKeys.user);
  GetUserData.instance.getUserDataInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
