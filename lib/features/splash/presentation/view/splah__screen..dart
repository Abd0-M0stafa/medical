import 'package:flutter/material.dart';
import 'package:medical/features/auth/data/data_sources/local_datasource/hive_local_datasource.dart';
import 'package:medical/features/auth/data/models/user_model.dart';
import 'package:medical/features/auth/presentation/view/login_screen.dart';
import 'package:medical/features/home/presentation/view/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Fade animation from 0 (invisible) to 1 (fully visible)
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    // Navigate to RegisterScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      UserModel? user = HiveLocalDatasource().getUserData();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => user == null ? LoginScreen() : HomeScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية السبلاش
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'assets/images/logo.png', // ضع مسار اللوجو بتاعك
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
