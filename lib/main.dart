import 'package:flutter/material.dart';
import 'package:medical/features/auth/presentation/view/register_screen.dart';
import 'package:medical/features/home/presentation/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const RegisterScreen());
  }
}
