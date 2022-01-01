import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socailmedia/features/auth/domin/use_case/use_case_register.dart';
import 'package:socailmedia/features/auth/persintation/manager/register_manager/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  AuthUsecaseRegister authUsecaseRegister;
  RegisterCubit({required this.authUsecaseRegister})
      : super(RegisterStateInit());

  static RegisterCubit of(context) => BlocProvider.of(context);

  // is Show Password
  bool isShowPassRegister = false;

  changeShowPassRegister() {
    isShowPassRegister = !isShowPassRegister;
    emit(RegisterStateChangePassword());
  }

  // register
  register(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    emit(RegisterStateLoading());

    (await authUsecaseRegister.call(
      Params(
        username: username,
        email: email,
        password: password,
        phone: phone,
      ),
    ))
        .fold((failure) {
      // ignore: avoid_print
      print("Failure = ${failure.message}");
      emit(RegisterStateError(failure));
    }, (registerModel) {
      // ignore: avoid_print
      print(registerModel.message);
      emit(RegisterStateSuccess(registerModel));
    });
  }
}
