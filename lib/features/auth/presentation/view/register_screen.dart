import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/core/functions/show_alert_dialog.dart';
import 'package:medical/core/utils/validators.dart';
import 'package:medical/core/widgets/app_text_field.dart';
import 'package:medical/core/widgets/primary_button.dart';
import 'package:medical/features/auth/data/data_sources/firebase_remote_datasource.dart';
import 'package:medical/features/auth/data/data_sources/local_datasource/hive_local_datasource.dart';
import 'package:medical/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:medical/features/auth/presentation/view/widgets/gender_selector.dart';
import 'package:medical/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:medical/features/home/presentation/view/home_view.dart';

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
    return BlocProvider(
      create: (context) => RegisterCubit(
        AuthRepoImpl(
          localDatasource: HiveLocalDatasource(),
          authRemoteDataSource: FirebaseRemoteDatasource(),
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SizedBox(
                  height: 240,
                  child: Image.asset('assets/images/shield_vector.png'),
                ),
                const Center(
                  child: Text(
                    'Create an account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    'Sign up to get started',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 114, 113, 112),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
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
                  obscure: true, // هتشتغل أيقونة الفيزابيليتي
                ),
                const SizedBox(height: 16),
                GenderSelector(
                  value: gender,
                  onChanged: (g) => setState(() => gender = g),
                ),
                const SizedBox(height: 16),

                const SizedBox(height: 24),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomeScreen(),
                        ),
                      );
                    } else if (state is RegisterFailure) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.failure.errMessage)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return PrimaryButton(
                        color: Colors.grey,
                        title: 'Login',
                        isLoading: true,
                      );
                    } else {
                      return PrimaryButton(
                        title: 'Create Account',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showBlockingDialog(context);
                            context.read<RegisterCubit>().email = email.text;
                            context.read<RegisterCubit>().password =
                                password.text;
                            context.read<RegisterCubit>().register();
                          }
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
