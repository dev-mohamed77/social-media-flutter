// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';
import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/utils/constant.dart';
import 'package:socailmedia/features/auth/data/model/login_model.dart';

abstract class AuthCachedDataSource {
  Future<String> getLastTokenThenlogin();

  Future<bool> cachedTokenThenLogin(LoginModel loginModel);
}

class AuthCachedDataSourceImp extends AuthCachedDataSource {
  final SharedPreferences sharedPreferences;

  AuthCachedDataSourceImp({required this.sharedPreferences});

  @override
  Future<String> getLastTokenThenlogin() {
    token = sharedPreferences.getString(CACHED_TOKEN);
    print("sharedToken = $token");

    if (token != null) {
      return Future.value(token);
    } else {
      throw LocalException();
    }
  }

  @override
  Future<bool> cachedTokenThenLogin(LoginModel loginModel) {
    Future<bool> tokenShared = sharedPreferences.setString(
      CACHED_TOKEN,
      "Bearer ${loginModel.token!}",
    );

    return tokenShared;
  }
}
