import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/splash/presentation/widget/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConfigColor.kDarkColor,
      body: const SplashBody(),
    );
  }
}
