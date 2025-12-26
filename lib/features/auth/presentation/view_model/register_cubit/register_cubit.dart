import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/core/errors/faliure.dart';
import 'package:medical/features/auth/data/models/register_user_request_model.dart';
import 'package:medical/features/auth/data/repositories/auth_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepoImpl) : super(RegisterInitial());
  final AuthRepoImpl authRepoImpl;

  String? email;
  String? password;

  Future<void> register() async {
    emit(RegisterLoading());
    RegisterUserRequestModel loginRequestModel = buildRequestModel();
    var result = await authRepoImpl.register(loginRequestModel);
    result.fold(
      (l) => emit(RegisterFailure(l)),
      (r) => emit(RegisterSuccess()),
    );
  }

  RegisterUserRequestModel buildRequestModel() {
    return RegisterUserRequestModel(email!, password!);
  }
}
