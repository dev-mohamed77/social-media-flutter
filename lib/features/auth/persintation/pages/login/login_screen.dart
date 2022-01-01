import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/auth/persintation/pages/login/widget/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConfigColor.kWhiteColor,
      appBar: AppBar(
        backgroundColor: ConfigColor.kWhiteColor,
        elevation: 0,
      ),
      body: LoginBody(),
    );
  }
}
