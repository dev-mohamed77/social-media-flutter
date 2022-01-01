import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/features/auth/data/model/login_model.dart';

abstract class LoginState {}

class LoginStateInit extends LoginState {}

// state login

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final LoginModel loginModel;
  LoginStateSuccess(this.loginModel);
}

class LoginStateWorng extends LoginState {
  String message;
  LoginStateWorng({
    required this.message,
  });
}

class LoginStateError extends LoginState {
  final Failure failure;
  LoginStateError(this.failure);
}

// state change password

class LoginStateChangeStatePassword extends LoginState {}
