import 'package:medical/core/errors/faliure.dart';

class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginFailureState extends LoginStates {
  final Failure failure;
  LoginFailureState(this.failure);
}
