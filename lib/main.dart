import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/helper/dio_helper.dart';
import 'package:socailmedia/dependency_injection.dart';
import 'app.dart';
import 'features/auth/data/data_source/auth_cach_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  DioHelper.init();

  // token
  cachToken();
  runApp(const MyApp());
}

cachToken() async {
  try {
    AuthCachedDataSourceImp(
      sharedPreferences: await SharedPreferences.getInstance(),
    ).getLastTokenThenlogin();
  } catch (err) {
    var a = LocalException.handel(err).failure;
    return a;
  }
}
