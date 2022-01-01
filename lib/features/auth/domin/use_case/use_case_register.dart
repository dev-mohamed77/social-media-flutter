import 'package:socailmedia/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:socailmedia/core/information_device/information_device_handler.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/auth/data/model/register_model.dart';
import 'package:socailmedia/features/auth/domin/repository/auth_domain_repo.dart';

class AuthUsecaseRegister implements UseCase<RegisterModel, Params> {
  final AuthDomainRepository repository;

  AuthUsecaseRegister({required this.repository});
  @override
  Future<Either<Failure, RegisterModel>> call(Params params) async {
    var deviceinfo = await getDeviceInfo();
    return await repository.register(
      requestRegister: RequestRegister(
        username: params.username,
        email: params.email,
        password: params.password,
        phone: params.phone,
        imie: deviceinfo.identifier,
        platform: deviceinfo.version,
      ),
    );
  }
}

class Params {
  String username;
  String email;
  String password;
  String phone;
  Params({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });
}
