import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/features/auth/data/model/login_model.dart';
import 'package:socailmedia/features/auth/data/model/register_model.dart';

abstract class AuthDomainRepository {
  Future<Either<Failure, LoginModel>> login({
    required RequestLogin requestLogin,
  });
  Future<Either<Failure, RegisterModel>> register({
    required RequestRegister requestRegister,
  });
}

class RequestLogin {
  String username;
  String password;
  String imie;
  String platform;
  RequestLogin({
    required this.username,
    required this.password,
    required this.imie,
    required this.platform,
  });
}

class RequestRegister {
  String username;
  String email;
  String password;
  String phone;
  String imie;
  String platform;
  RequestRegister({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.imie,
    required this.platform,
  });
}
