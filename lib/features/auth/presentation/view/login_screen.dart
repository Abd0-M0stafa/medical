// login_screen.dart
import 'package:flutter/material.dart';
import 'package:medical/core/utils/validators.dart';
import 'package:medical/core/widgets/app_text_field.dart';
import 'package:medical/core/widgets/primary_button.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              SizedBox(
                height: 240,
                child: Image.asset('assets/images/shield_vector.png'),
              ),
              Center(
                child: Text(
                  'Welcome back again',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Login to enter',
                  style: TextStyle(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 114, 113, 112),
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
                obscure: true,
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                title: 'Login',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
