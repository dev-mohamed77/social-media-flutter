import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/auth/persintation/pages/register/widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConfigColor.kWhiteColor,
      appBar: AppBar(
        backgroundColor: ConfigColor.kWhiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ConfigColor.kblueColor,
        ),
      ),
      body: RegisterBody(),
    );
  }
}
