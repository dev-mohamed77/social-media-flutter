import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/features/auth/data/model/register_model.dart';

abstract class RegisterState {}

class RegisterStateInit extends RegisterState {}

class RegisterStateChangePassword extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateSuccess extends RegisterState {
  final RegisterModel registerModel;

  RegisterStateSuccess(
    this.registerModel,
  );
}

class RegisterStateError extends RegisterState {
  final Failure failure;

  RegisterStateError(
    this.failure,
  );
}
