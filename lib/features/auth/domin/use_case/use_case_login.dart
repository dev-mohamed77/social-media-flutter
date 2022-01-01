import 'package:socailmedia/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:socailmedia/core/information_device/information_device_handler.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/auth/data/model/login_model.dart';
import 'package:socailmedia/features/auth/domin/repository/auth_domain_repo.dart';

class AuthUseCaseLogin implements UseCase<LoginModel, Params> {
  final AuthDomainRepository repository;

  AuthUseCaseLogin({required this.repository});

  @override
  Future<Either<Failure, LoginModel>> call(Params params) async {
    var deviceinfo = await getDeviceInfo();
    return await repository.login(
      requestLogin: RequestLogin(
        imie: deviceinfo.identifier,
        password: params.password,
        platform: deviceinfo.name,
        username: params.username,
      ),
    );
  }
}

class Params {
  final String username;
  final String password;
  Params({required this.username, required this.password});
}
