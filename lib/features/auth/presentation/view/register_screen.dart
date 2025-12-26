// register_screen.dart
import 'package:flutter/material.dart';
import 'package:medical/core/utils/validators.dart';
import 'package:medical/core/widgets/app_text_field.dart';
import 'package:medical/core/widgets/primary_button.dart';
import 'package:medical/features/auth/presentation/view/widgets/gender_selector.dart';
import 'package:medical/features/auth/presentation/view/widgets/patient_status_selector.dart';
import 'package:medical/features/auth/presentation/view_model/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  Gender? gender;
  String? status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                label: 'Full Name',
                controller: name,
                validator: (v) => Validators.requiredField(v, 'Name'),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              GenderSelector(
                value: gender,
                onChanged: (g) => setState(() => gender = g),
              ),
              const SizedBox(height: 16),

              // PatientStatusSelector(
              //   value: vm.patientStatus,
              //   onChanged: vm.setPatientStatus,
              // ),
              const SizedBox(height: 24),
              PrimaryButton(
                title: 'Create Account',
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      gender != null &&
                      status != null) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
