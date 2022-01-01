import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/helper/dio_helper.dart';
import 'package:socailmedia/features/auth/data/model/login_model.dart';
import 'package:socailmedia/features/auth/data/model/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({
    required String username,
    required String password,
  });
  Future<RegisterModel> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  });
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  @override
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    try {
      var dio = await DioHelper.postData(
        url: "user/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      return LoginModel.fromJson(dio.data);
    } on NetworkException {
      throw NetworkException;
    }
  }

  @override
  Future<RegisterModel> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      var registerData = await DioHelper.postData(
        url: "user/register",
        data: {
          "username": username,
          "email": email,
          "password": password,
          "phone": phone,
        },
      );
      return RegisterModel.fromJson(registerData.data);
    } on NetworkException {
      throw NetworkException;
    }
  }
}
