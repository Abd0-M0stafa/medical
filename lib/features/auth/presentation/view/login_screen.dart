import 'package:flutter/material.dart';
import 'package:medical/core/utils/validators.dart';
import 'package:medical/core/widgets/app_text_field.dart';
import 'package:medical/core/widgets/primary_button.dart';
import 'package:medical/features/auth/presentation/view/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                SizedBox(
                  height: 240,
                  child: Image.asset('assets/images/shield_vector.png'),
                ),
                const Center(
                  child: Text(
                    'Welcome back again',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    'Login to enter',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 114, 113, 112),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                AppTextField(
                  label: 'Email',
                  controller: email,
                  validator: Validators.email,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Password',
                  controller: password,
                  validator: Validators.password,
                  obscure: true, // أيقونة الفيزابيليتي
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  title: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // أضف هنا عملية تسجيل الدخول
                    }
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: const <Widget>[
                    Expanded(child: Divider()),
                    SizedBox(width: 20),
                    Text("OR"),
                    SizedBox(width: 20),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do not have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create new one",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 60, 161),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
