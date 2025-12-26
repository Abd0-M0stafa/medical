import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/features/auth/data/models/login_request_model.dart';
import 'package:medical/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:medical/features/auth/presentation/view_model/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepoImpl) : super(LoginInitialState());
  final AuthRepoImpl authRepoImpl;
  String? email;
  String? password;

  Future<void> login() async {
    emit(LoginLoadingState());
    LoginRequestModel loginRequestModel = buildRequestModel();
    var result = await authRepoImpl.login(loginRequestModel);
    result.fold(
      (l) => emit(LoginFailureState(l)),
      (r) => emit(LoginSuccessState()),
    );
  }

  LoginRequestModel buildRequestModel() {
    return LoginRequestModel(email: email!, password: password!);
  }
}
