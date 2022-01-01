import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socailmedia/features/auth/domin/use_case/use_case_login.dart';
import 'package:socailmedia/features/auth/persintation/manager/login_manager/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthUseCaseLogin useCaseLogin;
  LoginCubit({
    required this.useCaseLogin,
  }) : super(LoginStateInit());

  static LoginCubit of(context) => BlocProvider.of(context);

  login(String username, String password) async {
    emit(LoginStateLoading());

    (await useCaseLogin.call(
      Params(
        username: username,
        password: password,
      ),
    ))
        .fold((failure) {
      emit(LoginStateError(failure));
    }, (data) {
      emit(LoginStateSuccess(data));
    });
  }

  // Show Password
  bool isShowPass = false;

  void changeStatePass() {
    isShowPass = !isShowPass;
    emit(LoginStateChangeStatePassword());
  }
}
